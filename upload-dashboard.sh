#!/bin/bash

set -eo pipefail

ADMIN_PASSWORD=$(kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode)

folders=$(curl -u "admin:${ADMIN_PASSWORD}" localhost:3000/api/folders)
folderId=$(echo "${folders}" | jq -r '.[] | select(.title=="k8s") | .id')

if [ -z "${folderId}" ]; then
    echo "folder doesn't exist, creating it..."
    folder=$(curl -X POST -u "admin:${ADMIN_PASSWORD}" -H "Content-Type: application/json" localhost:3000/api/folders --data '{"title": "k8s"}')
    folderId=$(echo "${folder}" | jq -r '.id')
fi

for dashboardFile in "$@"; do
    echo "Uploading ${dashboardFile}..."
    body=$(jq -n --argjson folderId "${folderId}" --slurpfile dashboard "${dashboardFile}" '{"dashboard": $dashboard[0], "overwrite": true, "folderId": $folderId}')
    curl -X POST -u "admin:${ADMIN_PASSWORD}" -H "Content-Type: application/json" localhost:3000/api/dashboards/db --data "${body}"
done

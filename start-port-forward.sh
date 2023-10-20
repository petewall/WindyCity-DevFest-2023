#!/bin/bash

kubectl port-forward -n monitoring service/grafana 3000:service

#!/bin/bash

kubectl port-forward -n grafana service/grafana 3000:service
#!/bin/bash
sed "s/tagVersion/$1/g" k8s/Deployment.yml > Deploy.yml
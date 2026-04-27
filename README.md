# Jamf DevOps Homework

## Overview
I put this together to show a deployment (WordPress + DB) using Terraform and Helm. The goal wasn’t just to get it running, but to structure it in a way that makes sense for a real environment.

## Setup / Approach
Terraform is just being used to deploy the Helm chart.

Helm is doing most of the work here — handling the app config and Kubernetes resources.

I kept the structure simple on purpose:
- terraform/ → deployment entry point
- helm/ → app config + scaling
- manifests/ → examples of how secrets would be handled

## Secrets
I didn’t hardcode any credentials in this repo.

Instead, the app is set up to use:
existingSecret: wordpress-secret

So it expects a Kubernetes secret to already exist.

I included an example using External Secrets to show how that secret could come from AWS Secrets Manager.

Flow would look like:
AWS Secrets Manager → ExternalSecret → Kubernetes Secret → app

## Scaling / Resources
Added basic CPU + memory requests/limits so the pods aren’t running unbounded.

HPA is set to:
- min: 1
- max: 3
- scale on CPU (70%)

Nothing fancy, just enough to show the idea.

## If this were real
A few things I’d change if this was actually going to prod:
- move the DB out to RDS instead of running in-cluster
- add ingress + TLS instead of a basic service
- add monitoring/logging
- hook this into a CI/CD pipeline
- lock things down with RBAC + network policies

## Notes
This isn’t meant to be fully deployed as-is. It’s more of a reference for how I’d structure things and think through secrets, scaling, and separation of concerns.
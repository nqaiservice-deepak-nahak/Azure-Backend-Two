# Backend Two

NestJS microservice exposing:

```text
GET /api/service-two/hello
```

This repository creates only:

```text
Deployment
Service (ClusterIP)
```

It does **not** contain an Ingress. Backend One owns the shared Ingress.

## Azure DevOps variable group

Create:

```text
backend-two-variables
```

Suggested variables:

```text
AZURE_SERVICE_CONNECTION
ACR_SERVICE_CONNECTION
AKS_RESOURCE_GROUP
AKS_CLUSTER_NAME
K8S_NAMESPACE
BACKEND_TWO_IMAGE_URI
BACKEND_TWO_PORT
BACKEND_TWO_MESSAGE
ENVIRONMENT
BACKEND_TWO_REPLICA_COUNT
BACKEND_TWO_CPU
BACKEND_TWO_MEMORY
```

`.env.prod` uses:

```text
{{VARIABLE}}
```

`helm/backend-two/values.yaml` uses:

```text
$(VARIABLE)
```

# helm3

## Prerequisites
- Kubernetes 1.22+
- Helm 3.5.0+

## Parameters
The following table lists the helpers available in the library
| Key | Description | Default |
| --- | --- | --- |
| *NS_PREFIX* | Name Space Prefix | `aitrain` |
| *VERSION* | Version Type [ v2021-12 , v2022-07 ] | `v2022-07` |
| *OAUTH_TYPE* | OAuth Provider Type [ go-oauth , google-oauth , github-oauth ] | `go-oauth` |
| *DOAMINNAME* | URL Domian | `nchc.org.tw` |
| *EXISTING_SC_NAME* | Storage Class Name | `standard` |
| *INGRESS_CLASS* | Ingress Class Name | `nginx` |
| *DEST_CLUSTER_INPUT* | Destion Cluster Type [ OpenShift: OCP , Kubernetes: K8S ] | `K8S` |
| *K8S_DNS_SERVER* | DNS Server | `"10.43.0.10"` |
| *ingress_controller.enabled* | Ingress Controller Configuration | `false` |
| *rfstack.enabled* | RFStack Related Configuration | `false` |

**Useful links**
- https://helm.sh/docs/intro/using_helm/

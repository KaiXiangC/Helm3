# helm3

## Prerequisites
- Kubernetes 1.22+
- Helm 3.5.0+

## Getting started
### Package
```
helm package [chart path]
```
### Create Hub
```
helm repo index [folder name]
```
## Parameters
The following table lists the helpers available in the library

### common
| Key | Description | Default |
| --- | --- | --- |
| *common.destination* | Destion Cluster Type [ OpenShift: OCP , Kubernetes: K8S ] | `kubernetes` |
| *common.namespace_prefix* | Name Space Prefix | `aitrain` |
| *common.version* | Version Type [ v2021.12 , v2022.07 ] | `v2022.07` |
| *common.domian_name* | URL Domian | `"127-0-0-1.nip.io"` |
| *common.ingress_class* | Ingress Class Name | `nginx` |
| *common.k8s_dns_server* | DNS Server | `""` |
| *common.enable_vm* | VM Related Configuration | `false` |
| *common.oauth_type* | OAuth Provider Type [ go-oauth , google-oauth , github-oauth ] | `go-oauth` |

### storageclass
| Key | Description | Default |
| --- | --- | --- |
| *storageclass.install* | Install Storage Class | `false` |
| *storageclass.existing_sc_name* | Storage Class Name | `standard` |

### api
| Key | Description | Default |
| --- | --- | --- |
| *api.uid_start* | UID Start Value | `0` |
| *api.uid_count* | UID Count Value | `100000` |

**Useful links**
- https://helm.sh/docs/intro/using_helm/

{{/* Existing StorageClass name */}}
{{- define "SYSTEM_SC_NAME"}}
{{- printf "%s" .Values.storageclass.existing_sc_name }}
{{- end }}

{{- define "COURSE_SC_NAME"}}
{{- printf "%s" .Values.storageclass.existing_sc_name }}
{{- end }}

{{- define "UID_RANGE"}}
{{- div .Values.UID_START .Values.UID_COUNT }}
{{- end }}

{{/* URL for OAuth server */}}
{{- define "OAUTH_SERVER_URL"}}
{{- printf "%s-%s-oauth.%s" (.Values.common.version | replace "." "-") .Values.NS_PREFIX .Values.common.domian_name }}
{{- end }}

{{/* URL for UI */}}
{{- define "UI_URL"}}
{{- if ne .Values.ui.ingress_url "" }}
{{- printf "%s" .Values.ui.ingress_url }}
{{- else }}
{{- printf "%s-%s-ui.%s" (.Values.common.version | replace "." "-") .Values.common.namespace_prefix .Values.common.domian_name }}
{{- end }}
{{- end }}

{{/* NodePort Endpoint */}}
{{- define "NODEPORT_URL"}}
{{- printf "%s-%s-nodeport.%s" (.Values.common.version | replace "." "-") .Values.NS_PREFIX .Values.common.domian_name }}
{{- end }}

{{/* URL for admin UI */}}
{{- define "ADMIN_UI_URL"}}
{{- if ne .Values.admin_ui.ingress_url "" }}
{{- printf "%s" .Values.admin_ui.ingress_url }}
{{- else }}
{{- printf "%s-%s-admin.%s" (.Values.common.version | replace "." "-") .Values.common.namespace_prefix .Values.common.domian_name }}
{{- end }}
{{- end }}

{{/* URL for static UI */}}
{{- define "STATIC_UI_URL"}}
{{- if ne .Values.static_ui.ingress_url "" }}
{{- printf "%s" .Values.static_ui.ingress_url }}
{{- else }}
{{- printf "%s-%s-static.%s" (.Values.common.version | replace "." "-") .Values.common.namespace_prefix .Values.common.domian_name }}
{{- end }}
{{- end }}

{{/* Installation Version */}}
{{- define "VERSION"}}
{{- printf "%s" .Values.common.version }}
{{- end }}

{{/* IMG Version */}}
{{- define "API_IMG_VER"}}
{{- printf "%s" .Values.common.version }}
{{- end }}

{{- define "UI_IMG_VER"}}
{{- if ne .Values.ui.version "" }}
{{- printf "%s" .Values.ui.version }}
{{- else }}
{{- printf "%s" .Values.common.version }}
{{- end }}
{{- end }}

{{- define "RFSTACK_IMG_VER"}}
{{- if ne .Values.rfstack.version "" }}
{{- printf "%s" .Values.rfstack.version }}
{{- else }}
{{- printf "%s" .Values.common.version }}
{{- end }}
{{- end }}

{{- define "COURSE_IMG_VER"}}
{{- if ne .Values.course_operator.version "" }}
{{- printf "%s" .Values.course_operator.version }}
{{- else }}
{{- printf "%s" .Values.common.version }}
{{- end }}
{{- end }}

{{- define "ADMIN_UI_IMG_VER"}}
{{- if ne .Values.admin_ui.version "" }}
{{- printf "%s" .Values.admin_ui.version }}
{{- else }}
{{- printf "%s" .Values.common.version }}
{{- end }}
{{- end }}


{{- define "STATIC_UI_IMG_VER"}}
{{- if ne .Values.static_ui.version "" }}
{{- printf "%s" .Values.static_ui.version }}
{{- else }}
{{- printf "%s" .Values.common.version }}
{{- end }}
{{- end }}


{{- define "DB_IMG_VER"}}
{{- if ne .Values.database.version "" }}
{{- printf "%s" .Values.database.version }}
{{- else }}
{{- printf "%s" .Values.common.version }}
{{- end }}
{{- end }}

{{/* OAuth provider type */}}
{{- define "OAUTH_TYPE"}}
{{- if eq .Values.OAUTH_TYPE "google-oauth" }}
{{- printf "%s" .Values.OAUTH_TYPE }}
{{- else if eq .Values.OAUTH_TYPE "github-oauth" }}
{{- printf "%s" .Values.OAUTH_TYPE }}
{{- else }}
{{- printf "%s" .Values.OAUTH_TYPE }}
{{- end }}
{{- end }}

{{/* DNS Server */}}
{{- define "K8S_DNS_SERVER"}}
{{- if ne .Values.common.k8s_dns_server "" }}
{{- printf .Values.common.k8s_dns_server }}
{{- else }}
{{- printf "10.96.0.10" }}
{{- end }}
{{- end }}

{{/* SVC */}}
{{- define "ADMIN_UI_SVC"}}
{{- printf "%s-svc" .Values.admin_ui.name }}
{{- end }}

{{- define "STATIC_UI_SVC"}}
{{- printf "%s-svc" .Values.static_ui.name }}
{{- end }}

{{/* Expand the name of the chart. */}}
{{- define "aitrain-deploy.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- end }}
{{- end }}

{{/* Create a default fully qualified app name. */}}
{{- define "aitrain-deploy.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "aitrain-deploy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "aitrain-deploy.labels" -}}
helm.sh/chart: {{ include "aitrain-deploy.chart" . }}
{{ include "aitrain-deploy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "aitrain-deploy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aitrain-deploy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Create the name of the service account to use */}}
{{- define "aitrain-deploy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "aitrain-deploy.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

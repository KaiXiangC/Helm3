{{- define "OAUTH_SERVER_URL"}}
{{- printf "%s-%s-oauth.%s" .Values.VERSION .Values.NS_PREFIX .Values.DOAMINNAME }}
{{- end }}

{{- define "UID_RANGE"}}
{{- div .Values.UID_START .Values.UID_COUNT }}
{{- end }}

{{- define "UI_URL"}}
{{- printf "%s-%s-ui.%s" .Values.VERSION .Values.NS_PREFIX .Values.DOAMINNAME }}
{{- end }}

{{- define "NODEPORT_URL"}}
{{- printf "%s-%s-nodeport.%s" .Values.VERSION .Values.NS_PREFIX .Values.DOAMINNAME }}
{{- end }}

{{- define "ADMIN_UI_URL"}}
{{- printf "%s-%s-admin.%s" .Values.VERSION .Values.NS_PREFIX .Values.DOAMINNAME }}
{{- end }}

{{- define "STATIC_UI_URL"}}
{{- printf "%s-%s-static.%s" .Values.VERSION .Values.NS_PREFIX .Values.DOAMINNAME }}
{{- end }}

{{- define "API_IMG_VER"}}
{{- printf "%s" .Values.VERSION | replace "-" "." }}
{{- end }}

{{- define "UI_IMG_VER"}}
{{- printf "%s" .Values.VERSION | replace "-" "." }}
{{- end }}

{{- define "RFSTACK_IMG_VER"}}
{{- printf "%s" .Values.VERSION | replace "-" "." }}
{{- end }}

{{- define "COURSE_IMG_VER"}}
{{- printf "%s" .Values.VERSION | replace "-" "." }}
{{- end }}

{{- define "VERSION"}}
{{- printf "%s" .Values.VERSION | replace "-" "." }}
{{- end }}

{{- define "OAUTH_TYPE"}}
{{- if eq .Values.OAUTH_TYPE "google-oauth" }}
{{- printf "%s" .Values.OAUTH_TYPE }}
{{- else if eq .Values.OAUTH_TYPE "github-oauth" }}
{{- printf "%s" .Values.OAUTH_TYPE }}
{{- else }}
{{- printf "%s" .Values.OAUTH_TYPE }}
{{- end }}
{{- end }}

{{- define "K8S_DNS_SERVER"}}
{{- if eq .Values.K8S_DNS_SERVER "OCP" }}
{{- printf "172.30.0.10" }}
{{- else }}
{{- printf "10.12.0.10" }}
{{- end }}
{{- end }}

{{- define "ADMIN_UI_SVC"}}
{{- printf "%s-svc" .Values.ADMIN_UI }}
{{- end }}

{{- define "STATIC_UI_SVC"}}
{{- printf "%s-svc" .Values.STATIC_UI }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "aitrain-deploy.name" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "aitrain-deploy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "aitrain-deploy.labels" -}}
helm.sh/chart: {{ include "aitrain-deploy.chart" . }}
{{ include "aitrain-deploy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "aitrain-deploy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aitrain-deploy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "aitrain-deploy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "aitrain-deploy.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

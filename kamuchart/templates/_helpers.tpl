{{/*
Expand the name of the chart.
*/}}
{{- define "kamuchart.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kamuchart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" (include "kamuchart.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kamuchart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kamuchart.labels" -}}
helm.sh/chart: {{ include "kamuchart.chart" . }}
{{ include "kamuchart.selectorLabels" . }}
{{- if .Values.version }}
app.kubernetes.io/version: {{ .Values.version | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kamuchart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kamuchart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Datadog selector labels
*/}}
{{- define "kamuchart.datadogSelectorLabels" -}}
tags.datadoghq.com/env: {{ .Values.environment }}
tags.datadoghq.com/service: "{{ include "kamuchart.fullname" . }}"
tags.datadoghq.com/version: {{ .Values.version | quote }}
language: {{ .Values.language }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kamuchart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kamuchart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

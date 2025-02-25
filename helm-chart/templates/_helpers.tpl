{{- define "ussd-platform.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ussd-platform.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ussd-platform.labels" -}}
app: {{ .Values.appName }}
release: {{ .Release.Name }}
helm.sh/chart: {{ include "ussd-platform.chart" . }}
{{ include "ussd-platform.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ussd-platform.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ussd-platform.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "backend-two.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "backend-two.fullname" -}}
{{- default .Release.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "backend-two.selectorLabels" -}}
app.kubernetes.io/name: {{ include "backend-two.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "backend-two.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote }}
{{ include "backend-two.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "backend-two.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "backend-two.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end }}
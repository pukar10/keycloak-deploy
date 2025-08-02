{{/*
  Common labels helper so we don’t repeat ourselves.
*/}}
{{- define "keycloak-deploy.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ .Chart.Name }}
{{- end }}
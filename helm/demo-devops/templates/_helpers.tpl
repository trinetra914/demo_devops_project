{{- define "demo-devops.name" -}}
demo-devops
{{- end -}}

{{/*
Create a default fully qualified app name.
We use the short name since this is a simple, single-component app.
*/}}
{{- define "demo-devops.fullname" -}}
{{- include "demo-devops.name" . | trunc 63 | trimSuffix "-" }}
{{- end -}}

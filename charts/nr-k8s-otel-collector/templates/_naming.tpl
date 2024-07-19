{{- /* Naming helpers*/ -}}
{{- define "nrKubernetesOtel.deployment.fullname" -}}
{{- include "newrelic.common.naming.truncateToDNSWithSuffix" (dict "name" (include "newrelic.common.naming.fullname" .) "suffix" "deployment") -}}
{{- end -}}

{{- define "nrKubernetesOtel.daemonset.fullname" -}}
{{- include "newrelic.common.naming.truncateToDNSWithSuffix" (dict "name" (include "newrelic.common.naming.fullname" .) "suffix" "daemonset") -}}
{{- end -}}

{{/* Internal helper function to generate a default deployment config map name when a name is not provided. */}}
{{- define "nrKubernetesOtel.deployment.configMap.defaultName" -}}
{{- include "newrelic.common.naming.truncateToDNSWithSuffix" (dict "name" (include "newrelic.common.naming.fullname" .) "suffix" "deployment-config") -}}
{{- end -}}

{{/* Internal helper function to generate a default daemonset config map name when a name is not provided. */}}
{{- define "nrKubernetesOtel.daemonset.configMap.defaultName" -}}
{{- include "newrelic.common.naming.truncateToDNSWithSuffix" (dict "name" (include "newrelic.common.naming.fullname" .) "suffix" "daemonset-config") -}}
{{- end -}}
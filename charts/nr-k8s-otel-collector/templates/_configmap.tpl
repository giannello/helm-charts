{{- /* Defines if the deployment config map has to be created or not */ -}}
{{- define "nrKubernetesOtel.deployment.configMap.create" -}}
{{- $valueFound := false -}}

{{- /* Look for a local creation of a deployment config map */ -}}
{{- if get .Values.deployment "configMap" | kindIs "map" -}}
    {{- if (get .Values.deployment.configMap "create" | kindIs "bool") -}}
        {{- $valueFound = true -}}
        {{- if .Values.deployment.configMap.create -}}
            {{- /*
                We want only to return when this is true, returning `false` here will template "false" (string) when doing
                an `(include "nrKubernetesOtel.deployment.configMap.name" .)`, which is not an "empty string" so it is `true` if it is used
                as an evaluation somewhere else.
            */ -}}
            {{- .Values.deployment.configMap.create -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{- /* In case no configMap value has been found, default to "true" */ -}}
{{- if not $valueFound -}}
true
{{- end -}}
{{- end -}}


{{- /* Defines the name of the deployment config map */ -}}
{{- define "nrKubernetesOtel.deployment.configMap.name" -}}
{{- $localConfigMap := "" -}}
{{- if get .Values.deployment "configMap" | kindIs "map" -}}
    {{- if (get .Values.deployment.configMap "name" | kindIs "string") -}}
        {{- $localConfigMap = (include "newrelic.common.naming.truncateToDNS" .Values.deployment.configMap.name) -}}
    {{- end -}}
{{- end -}}

{{- if (include "nrKubernetesOtel.deployment.configMap.create" .) -}}
    {{- $localConfigMap | default (include "nrKubernetesOtel.deployment.configMap.defaultName" .) -}}
{{- else -}}
    {{- $localConfigMap | default "default" -}}
{{- end -}}
{{- end -}}
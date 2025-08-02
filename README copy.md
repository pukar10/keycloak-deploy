# README

This repo ships a super‑light wrapper around the Bitnami **Keycloak** chart so
I can keep all homelab‑specific tweaks (admin secret, ingress host, DB size,
etc.) under version control without forking the upstream chart.

## 🔧 Quick start

```bash
# add the repo that will host this chart (once you’ve pushed it)
helm repo add homelab https://<YOUR-DOMAIN>/helm
helm repo update

# install/upgrade
helm upgrade --install keycloak homelab/keycloak-deploy \
  --namespace keycloak --create-namespace
```

**Get the admin password** <br>
If you left the default `adminSecret.create=true`:

    export KC_NS={{ .Release.Namespace }}
    kubectl -n $KC_NS get secret {{ .Values.adminSecret.name }} \
        -o jsonpath="{.data.admin-password}" | base64 -d; echo

**Access Keycloak** <br>
Add an `/etc/hosts` entry or update your DNS so that

    keycloak.homelab.lan → <INGRESS_CONTROLLER_IP>

Then open: <br>

    https://keycloak.homelab.lan

**Username:** {{ .Values.adminSecret.adminUser }} <br>
**Password:** <admin_pass_above>

**Troubleshooting** <br>
• `kubectl -n {{ .Release.Namespace }} logs sts/{{ include "keycloak.fullname" . }}` <br>
• `kubectl get ingress -A` and make sure the ADDRESS column is populated.


# README

Wrapper for keycloak.<br>

## Deploy new version
How to test an update update <br>
- [ ] Bump version
- [ ] helm package
- [ ] helm upgrade
- [ ] Delete keycloak pod

```
helm upgrade keycloak ./keycloak-deploy-<version>.tgz \
  --namespace keycloak \
  --values values.yaml
```
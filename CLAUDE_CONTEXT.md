# Project Context

## Infrastructure

- K3s cluster on Hetzner VPS
- Cilium CNI with NetworkPolicies
- Traefik ingress controller
- cert-manager with Let's Encrypt (DNS-01 via Cloudflare)
- Domain: outatime.live (wildcard cert)

## Deployment

- GitHub Actions CI/CD (push-based)
- GitHub Container Registry (ghcr.io)
- Org-level KUBE_CONFIG secret
- kubernetes-replicator for pull secrets

## Workflow

- Repo name becomes namespace and subdomain
- Push to main → build → deploy → health check
- Auto-rollback on failure (existing apps)
- Auto-cleanup on failure (new apps)

## Files Structure

- `.github/workflows/deploy.yml` - CI/CD pipeline
- `k8s/deployment.yaml` - uses {{APP_NAME}}, {{IMAGE}}
- `k8s/service.yaml`
- `k8s/ingress.yaml` - uses {{DOMAIN}}

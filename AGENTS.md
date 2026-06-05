# AGENTS.md

## Project

Dockette Candoo is a PHP 7.4 FPM Alpine image bundled with Caddy for serving applications from `/srv`. It exposes Caddy on container port `2015`.

## Image

- Image name is `dockette/candoo`.
- Default tag is `latest`, controlled by `DOCKER_TAG`.
- Build context is the repository root.
- `Dockerfile` uses `php:7.4-fpm-alpine`, installs Caddy via `getcaddy.com`, installs Composer, and enables MySQL and PostgreSQL PHP extensions.
- `Caddyfile` is copied to `/etc/Caddyfile` and the default command runs Caddy with logs on stdout.

## Commands

- `make build` builds `${DOCKER_IMAGE}:${DOCKER_TAG}` from `.`.
- `make test` checks `php -v` and `caddy -version` inside the built image.
- `make run` starts an interactive container on `8080:2015` with the current directory mounted to `/srv:delegated`.

## Runtime Notes

- No Compose file is present; local runtime is direct `docker run`.
- Keep host port `8080` and container port `2015` aligned with README usage if the Caddy configuration changes.
- GitHub Actions builds context `.` and tests it with `DOCKER_IMAGE` and `DOCKER_TAG` Makefile variables.
- Public Docker Hub tags for `dockette/candoo` may be unpublished; README usage should prefer local builds.

## Guidelines

- Keep `README.md`, `Makefile`, `Dockerfile`, `Caddyfile`, and `.github/workflows/docker.yml` aligned when changing runtime behavior.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
- Do not introduce unrelated formatting or structural changes.

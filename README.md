<h1 align=center>Dockette / Candoo</h1>

<p align=center>
   Caddy server with PHP 8.5.
</p>

-----

PHP 8.5 FPM on Alpine with [Caddy](https://caddyserver.com) in one image. It serves the files in `/srv`.

## Features

- Base `php:8.5-fpm-alpine`, Caddy from Alpine packages, Composer
- PHP extensions `mbstring`, `mysqli`, `pdo`, `pdo_mysql`, `pgsql`, `pdo_pgsql`
- Caddy listens on port `2015`, config in `/etc/Caddyfile`

## Usage

```sh
# Build the image locally
DOCKER_TAG=local make build

# Serve the current directory on http://localhost:8080
docker run --rm -it -p 8080:2015 -v $(pwd):/srv:delegated dockette/candoo:local
```

## Versions

| Version | Release |
|---------|---------|
| `dockette/candoo:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/candoo:latest` | latest build of `master` |

Releases are listed on [GitHub](https://github.com/dockette/candoo/releases).

## Development

```sh
make build          # build the image
make test           # check PHP, Caddy and iconv
make run            # serve the current directory on port 8080
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.

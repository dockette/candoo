<h1 align=center>Dockette / Candoo</h1>

Caddy server with PHP 7.4.

This is a legacy image. It uses PHP 7.4, which is end-of-life. Do not use it for new production deployments.

Public Docker Hub tags for `dockette/candoo` are not currently published. Build the image locally before running it.

-----

## Usage

```bash
DOCKER_TAG=local make build
docker run --rm -it -p 8080:2015 -v $(pwd):/srv:delegated dockette/candoo:local
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.

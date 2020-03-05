## [chris102994/docker-tinymediamanager](https://github.com/chris102994/docker-tinymediamanager)

[![https://www.tinymediamanager.org/](https://gitlab.com/uploads/-/system/user/avatar/2501205/avatar.png?width=400)](https://www.tinymediamanager.org/)

[![Build Status](https://travis-ci.com/chris102994/docker-tinymediamanager.svg?branch=master)](https://travis-ci.com/chris102994/docker-tinymediamanager)
[![Microbadger Size & Layers](https://images.microbadger.com/badges/image/christopher102994/docker-tinymediamanager.svg)](https://microbadger.com/images/christopher102994/docker-tinymediamanager "Get your own image badge on microbadger.com")
[![Image Pulls](https://img.shields.io/docker/pulls/christopher102994/docker-tinymediamanager)](https://hub.docker.com/repository/docker/christopher102994/docker-tinymediamanager)
 [![Alpine](https://images.microbadger.com/badges/version/christopher102994/docker-tinymediamanager:latest.svg)](https://microbadger.com/images/christopher102994/docker-tinymediamanager:latest "Get your own version badge on microbadger.com")

## Outside Packages
* Built on my [Base GUI Image](https://github.com/chris102994/docker-base-image-gui)
  * [Tiny Media Manager](https://www.tinymediamanager.org/) is a media management tool written in Java/Swing. It is written to provide metadata for the Kodi Media Center (formerly known as XBMC), MediaPortal and Plex media server.

## Docker
```
docker run \
	--name=docker-tinymediamanager \
	-p 5700:5700 \
	-v </path/to/appdata/config>:/config \
  	-v </path/to/tv/shows>:/tv \
  	-v </path/to/movies>:/movies \
	--restart unless-stopped \
	christopher102994/docker-tinymediamanager:latest
```

## Parameters
Container specific parameters passed at runtime. The format is `<external>:<internal>` (e.g. `-p 443:22` maps the container's port 22 to the host's port 443).

| Parameter | Function |
| -------- | -------- |
| -p 5700 | The web encrypted UI port. |
| -v /config | The directory where the application will store configuration information. |
| -v /tv | The path to your tv shows. |
| -v /movies | The path to your movies. |

## Application Setup

The admin interface is available at `http://<ip>:<port>/`

Access the mounted files within the web interface at `/tv` and `/movies`

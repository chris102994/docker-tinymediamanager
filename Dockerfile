# Pull the base image
ARG BASE_IMAGE=unknown
FROM ${BASE_IMAGE}
MAINTAINER chris102994<chris102994@yahoo.com>
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/chris102994/docker-tinymediamanager"
ENV APP_NAME=TinyMediaManager

ENV TMM_VERSION=3.1.2
ENV TMM_DL_URL=https://release.tinymediamanager.org/v3/dist/tmm_${TMM_VERSION}_linux.tar.gz

RUN echo "##### Downloading Virtual Build Dependencies #####" && \
		inst-pkg --virtual build-dependencies \
			curl \
			tar \
			tzdata \
			xz && \
	echo "##### Downloading Runtime Packages #####" && \
		inst-pkg \
			openjdk8-jre \
			libmediainfo \
			ttf-dejavu && \
	echo "#### Downloading TinyMediaManager ####" && \
		curl -L -s ${TMM_DL_URL} | tar xvzf - -C /app && \
		mkdir -p \
			/config/data \
			/config/log  \
			/tv \
			/movies && \
		ln -s /config/data /app/data && \
		ln -s /config/log /app/logs && \
		ln -s /config/log/launcher.log /app/launcher.log && \
		chown -R 900:900 /tv && \
		chmod -R 0755 /tv && \
		chown -R 900:900 /movies && \
		chmod -R 0755 /movies && \
    echo "##### App Setup #####" && \
		sed -i 's#APP_COMMAND#/usr/bin/java -jar /app/getdown.jar /app >> /config/log/tinymediamanager.log#g' /app/start_app.sh && \
		cp /app/tmm.png /etc/noVNC/app/images/icons/novnc-16x16.png && \
	echo "##### Cleaning Up #####" && \
		rm-pkg build-dependencies
VOLUME		["/tv"]
VOLUME		["/movies"]
#Work Dir
WORKDIR /mnt

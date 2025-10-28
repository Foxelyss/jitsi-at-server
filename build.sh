#!/bin/env bash

latest_version=$(wget -q -O - https://api.github.com/repos/jitsi/docker-jitsi-meet/releases/latest | grep zip | cut -d\" -f4)

echo $latest_version > current_version.txt

wget $latest_version -O ./jitsi.zip

unzip jitsi.zip

jitsi_directory=$(ls | grep jitsi-docker)

mv $jitsi_directory jitsi-docker

mkdir -p ~/.jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}

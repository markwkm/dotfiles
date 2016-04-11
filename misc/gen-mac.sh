#!/bin/sh

MAC="00:16:3e:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//')"
echo $MAC

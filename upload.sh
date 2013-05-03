#!/usr/bin/env bash
scp -i .ssh/gordon.vps -r build/html/* gordon@208.87.241.78:/var/www/gitdoc/
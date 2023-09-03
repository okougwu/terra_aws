#!/bin/bash
apt-get update
apt-get install -y nginx docker.io
sudo usermod -aG ubuntu docker

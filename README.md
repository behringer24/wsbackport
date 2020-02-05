# wsbackport
A simple Dockerfile for a webserver suitable for getting your classic code containerized in docker. Based on Debian 10-slim Buster, Apache 2 and PHP 5.6

## Goal
This image provides a well known environment if you are familiar with setting up your application on Debian based Linux servers with Apache 2. This Image also provides PHP 5.6 to enable you running older PHP code that needs to be ported to PHP 7.x.

## Considerations
I do not recommend running your code on PHP 5.6, I provide this image to help you containerizing your legacy application and continue updating your application to run with newer distributions.

This container is based on a full Debian 10 Buster (slim). There are smaller base images available and this is also only to get your application containerized as easy as possible.
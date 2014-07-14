# Vagrant (Buildpack)

Basic Vagrant environment created by Puppet for playing with Heroku's buildpacks.

## Requirements

  * Vagrant
  * VirtualBox

## Usage

NOTE: Make sure to update the submodules before getting started.

    $ git submodule update --init

Quick start:

    $ vagrant up
    $ vagrant ssh
    vagrant $ compile samples/rack
    vagrant $ install rack.slug
    vagrant $ web

Running different process types:

    vagrant $ rake db:migrate
    vagrant $ console
    vagrant $ worker

Running different languages:

    vagrant $ compile samples/php
    vagrant $ compile samples/rack
    vagrant $ install rack.slug
    vagrant $ rake
    vagrant $ install php.slug
    vagrant $ web

## Tested with

 * Ubuntu 14.04 x64
 * Vagrant 1.6.3
 * VirtualBox 4.3.12 r93733

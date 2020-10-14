# user-files
[![GitHub Stable Release](https://img.shields.io/badge/Release-3.537-blue.svg)](https://github.com/BradleyA/user-files/releases/tag/3.537)
![GitHub Release Date](https://img.shields.io/github/release-date/BradleyA/user-files?color=blue)
[![GitHub Commits Since](https://img.shields.io/github/commits-since/BradleyA/user-files/3.537?color=orange)](https://github.com/BradleyA/user-files/commits/)
[![GitHub Last Commits](https://img.shields.io/github/last-commit/BradleyA/user-files.svg)](https://github.com/BradleyA/user-files/commits/)

[![GitHub Open Issues](https://img.shields.io/github/issues/BradleyA/user-files?color=purple)](https://github.com/BradleyA/user-files/issues?q=is%3Aopen+is%3Aissue)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed/BradleyA/user-files?color=purple)](https://github.com/BradleyA/user-files/issues?q=is%3Aclosed+is%3Aissue)
[<img alt="GitHub Clones" src="https://img.shields.io/static/v1?label=Clones&message=266&color=blueviolet">](https://github.com/BradleyA/user-files/blob/master/images/clone.table.md)
[<img alt="GitHub Views" src="https://img.shields.io/static/v1?label=Views&message=1475&color=blueviolet">](https://github.com/BradleyA/user-files/blob/master/images/view.table.md)
[![GitHub Size](https://img.shields.io/github/repo-size/BradleyA/user-files.svg)](https://github.com/BradleyA/user-files/)
![Language Bash](https://img.shields.io/badge/%20Language-bash-blue.svg)
[![MIT License](http://img.shields.io/badge/License-MIT-blue.png)](LICENSE)

----

Testing other links from other repositories:

[![Go Report Card](https://goreportcard.com/badge/github.com/cjimti/iotwifi)](https://goreportcard.com/report/github.com/cjimti/iotwifi)
[![GoDoc](https://godoc.org/github.com/cjimti/iotwifi/iotwifi?status.svg)](https://godoc.org/github.com/cjimti/iotwifi/iotwifi)
[![Docker Container Image Size](https://shields.beevelop.com/docker/image/image-size/cjimti/iotwifi/latest.svg)](https://hub.docker.com/r/cjimti/iotwifi/)
[![Docker Container Layers](https://shields.beevelop.com/docker/image/layers/cjimti/iotwifi/latest.svg)](https://hub.docker.com/r/cjimti/iotwifi/)
[![Docker Container Pulls](https://img.shields.io/docker/pulls/cjimti/iotwifi.svg)](https://hub.docker.com/r/cjimti/iotwifi/)

[![Go Report Card](https://goreportcard.com/badge/github.com/wagoodman/dive)](https://goreportcard.com/report/github.com/wagoodman/dive)
[![Pipeline Status](https://circleci.com/gh/wagoodman/dive.svg?style=svg)](https://circleci.com/gh/wagoodman/dive)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=flat)](https://www.paypal.me/wagoodman)

[![Donate](https://img.shields.io/badge/donate-paypal-yellowgreen.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ZEW8TFQCU2MSJ&source=url)
[![Docker Build Status](https://github.com/oznu/docker-homebridge/workflows/Build/badge.svg)](https://github.com/oznu/docker-homebridge/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/oznu/homebridge.svg)](https://hub.docker.com/r/oznu/homebridge/)
[![Discord](https://img.shields.io/discord/432663330281226270?color=728ED5&logo=discord&label=discord)](https://discord.gg/Cmq8a44)

[![Join the chat at https://gitter.im/hypriot/talk](https://badges.gitter.im/hypriot/talk.svg)](https://gitter.im/hypriot/talk?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](https://circleci.com/gh/hypriot/image-builder-rpi.svg?style=svg)](https://circleci.com/gh/hypriot/image-builder-rpi)
[![Latest Release](https://img.shields.io/github/downloads/hypriot/image-builder-rpi/v1.12.1/total.svg)](https://github.com/hypriot/image-builder-rpi/releases/tag/v1.12.1)
[![All Releases](https://img.shields.io/github/downloads/hypriot/image-builder-rpi/total.svg)](https://github.com/hypriot/image-builder-rpi/releases)
<a href="https://liberapay.com/Hypriot/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a>

----

[![Latest Release](https://img.shields.io/github/downloads/BradleyA/user-files/3.537/total.svg)](https://github.com/BradleyA/user-files/releases/tag/3.537)
[![All Releases](https://img.shields.io/github/downloads/BradleyA/user-files/total.svg)](https://github.com/BradleyA/user-files/releases)

----

## Goal

General user files, dot files, with a few special tweeks to make my system time better. When setting up a new system, I pull these files to update my user profiles.

#### If you like this repository, select in the upper-right corner, [![GitHub stars](https://img.shields.io/github/stars/BradleyA/user-files.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/BradleyA/user-files/stargazers/), thank you.

<details>
<summary>Table of content</summary>
    
    
## Table of content
- [Description](#Description)
- [Command Descriptions](#Command-Descriptions)
    - [ARCHITECTURE TREE](#ARCHITECTURE-TREE)
    - [Future Objectives](#Future-Objectives)
    - [Author](#Author)
    - [System OS script tested](#System-OS-script-tested)
    - [Design Principles](#Design-Principles)
    - [License](#License)

</details>

----

## Description

**template directory**, there are a few template files (sh,py) that include **production standards** that I designed as best practices when creating new scripts.  When creating a new script I merge sections of code needed from a template file.  Some of the production standards are --help, DEBUG, log format, shellcheck, Documentation Language, Copyright, Architecture tree, Default variable value, --usage, and Parse CLI options and arguments.  When a production standard is changed it's verson number is updated with the git tag version number.  This allows scripts in development, test, and production to be maintianed with the latest production standard verson.

## Clone

To clone, change directory to the location you want to download the scripts (example: cd ~/github).  Use git to pull or clone these files into the directory. If you do not have git then enter; "sudo apt-get install git" if using Ubuntu. On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/user-files.git
    cd user-files

## Install dot Files
To copy/over-write dot files into your home directory enter the following steps.

    cd
    git clone https://github.com/BradleyA/user-files.git
    user-files/bin/copy-user-dot
    rm -rf ./user-files

## Install a File

To download the latest commit of one of these files, for example .gitignore, change to the location you want to download.  If in sub-directory on Github include the directory; example   FILEX=bin/term-layout.sh

    FILEX=.gitignore
    curl -L https://api.github.com/repos/BradleyA/user-files/tarball | tar -xzf - --wildcards BradleyA-user-files-*/$FILEX ; mv BradleyA-user-files-*/$FILEX . ; rm -r BradleyA-user-files-*/

## Files

.bash_aliases

.bashrc

.dockerignore

.gitconfig

.gitignore

.profile

.vimrc

./ssh/config

./bin/find-code.sh

./etc/ssh/(ssh_config-$HOSTNAME, sshd_config-$HOSTNAME)

./hooks/(post-commit, pre-commit, README.md, var-git-test.examples)

./template/template.py

./template/template.sh

./template/TEST/template.sh/(FVT-option-TEST_CASES , FVT-setup.sh)

#### Author
[<img id="github" src="images/github.png" width="50" a="https://github.com/BradleyA/">](https://github.com/BradleyA/)    [<img src="images/linkedin.png" style="max-width:100%;" >](https://www.linkedin.com/in/bradleyhallen) [<img id="twitter" src="images/twitter.png" width="50" a="twitter.com/bradleyaustintx/">](https://twitter.com/bradleyaustintx/)       <a href="https://twitter.com/intent/follow?screen_name=bradleyaustintx"> <img src="https://img.shields.io/twitter/follow/bradleyaustintx.svg?label=Follow%20@bradleyaustintx" alt="Follow @bradleyaustintx" />    </a>

[![GitHub followers](https://img.shields.io/github/followers/BradleyA.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/BradleyA?tab=followers)

#### System OS script tested
 * Ubuntu 14.04.3   LTS (amd64,armv7l)
 * Ubuntu 16.04.3-5 LTS (armv7l)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

#### License
MIT License

Copyright (c) 2020  [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

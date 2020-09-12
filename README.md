# user-files
[![Stable Release](https://img.shields.io/badge/Release-3.537-blue.svg)](https://github.com/BradleyA/user-files/releases/tag/3.537)
[![GitHub commits](https://img.shields.io/github/commits-since/BradleyA/user-files/3.537.svg)](https://github.com/BradleyA/user-files/commits/)
[![MIT License](http://img.shields.io/badge/License-MIT-red.png)](LICENSE)
[<img alt="Clones" src="https://img.shields.io/static/v1?label=Clones&message=236&color=blue">](images/clone.table.md)
[<img alt="Views" src="https://img.shields.io/static/v1?label=Views&message=1421&color=blue">](images/view.table.md)

[![GitHub Stable Release](https://img.shields.io/badge/Release-3.537-blue.svg)](https://github.com/BradleyA/user-files/releases/tag/3.537)
![GitHub Release Date](https://img.shields.io/github/release-date/BradleyA/user-files?color=blue)
[![GitHub Commits Since](https://img.shields.io/github/commits-since/BradleyA/user-files/3.537?color=orange)](https://github.com/BradleyA/user-files/commits/)
[![GitHub Last Commits](https://img.shields.io/github/last-commit/BradleyA/user-files.svg)](https://github.com/BradleyA/user-files/commits/)

[![GitHub Open Issues](https://img.shields.io/github/issues/BradleyA/user-files?color=purple)](https://github.com/BradleyA/user-files/issues?q=is%3Aopen+is%3Aissue)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed/BradleyA/user-files?color=purple)](https://github.com/BradleyA/user-files/issues?q=is%3Aclosed+is%3Aissue)
[<img alt="GitHub Clones" src="https://img.shields.io/static/v1?label=Clones&message=190&color=blueviolet">](https://github.com/BradleyA/user-files/blob/master/images/clone.table.md)
[<img alt="GitHub Views" src="https://img.shields.io/static/v1?label=Views&message=3071&color=blueviolet">](https://github.com/BradleyA/user-files/blob/master/images/view.table.md)
[![GitHub Size](https://img.shields.io/github/repo-size/BradleyA/user-files.svg)](https://github.com/BradleyA/user-files/)
![Written in Bash](https://img.shields.io/badge/written%20in-bash-blue.svg)
[![MIT License](http://img.shields.io/badge/License-MIT-blue.png)](LICENSE)

----

General user files, dot files, with a few special tweeks to make my system time better.  When setting up a new system, I pull these files to update my user profiles.

**template directory**, there are a few template files (sh,py) that include **production standards** that I designed as best practices when creating new scripts.  When creating a new script I merge sections of code needed from a template file.  Some of the production standards are --help, DEBUG, log format, shellcheck, Documentation Language, Copyright, Architecture tree, Default variable value, --usage, and Parse CLI options and arguments.  When a production standard is changed it's verson number is updated with the git tag version number.  This allows scripts in development, test, and production to be maintianed with the latest production standard verson.

#### If you like this repository, select in the upper-right corner, star, thank you.

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

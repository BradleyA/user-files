# user-files  [![Stable Release](https://img.shields.io/badge/Release-3.227-blue.svg)](https://github.com/BradleyA/user-files/releases/tag/3.227)    [![GitHub commits](https://img.shields.io/github/commits-since/BradleyA/user-files/3.227.svg)](https://github.com/BradleyA/user-files/commits/)
General user files, dot files, with a few special tweeks to make my system time better.  When setting up a new system, I pull these files to update my user profiles.

**template directory**, there are a few template files (sh,py) that include **production standards** that I designed as best practices when creating new scripts.  When creating a new script I merge sections of code needed from a template file.  Some of the production standards are --help, DEBUG, log format, shellcheck, Documentation Language, Copyright, Architecture tree, Default variable value, --usage, and Parse CLI options and arguments.  When a production standard is changed it's verson number is updated with the git tag version number.  This allows scripts in development, test, and production to be maintianed with the latest production standard verson.

**hooks directory**, there are two GitHub commit hooks that support running of **test cases**.  The pre-commit GitHub hook bash script creates a list of commited files with repository subdirectory.  The post-commit GitHub hook bash script runs found FVT test case(s) for a commited file.  The hooks directory was created because I wanted to modify the github hooks and track changes per repository.  Learn more about how to setup test cases using these tools, below:

#### If you like this repository, select in the upper-right corner, star, thank you.

## Clone

To clone, change directory to the location you want to download the scripts (example: cd ~/github).  Use git to pull or clone these files into the directory. If you do not have Git then enter; "sudo apt-get install git". On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/user-files.git
    cd user-files/hooks
    ln -s ../../hooks/post-commit ../.git/hooks/post-commit
    ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit

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

## Setup Test Cases

    git clone https://github.com/BradleyA/user-files.git
    cd user-files/hooks
    ln -s ../../hooks/post-commit ../.git/hooks/post-commit
    ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit
    cd ..
    mkdir TEST/<FILE_TO_BE_TESTED>/FVT-<test-case-name-no-dot-001>

Place the expected results from the test case into a file with the same name but add '.expcted'.  In your test case pipe the output into a file with the same name but add '.out'.  at the end of your test case include the following lines:

    #
    diff "${0}".expected "${0}".out >/dev/null 2>&1
    RETURN_CODE=${?}
    if [ ${RETURN_CODE} -eq 0 ] ; then
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - No difference with expected output - ${BOLD}PASS - PASS${NORMAL}"
    elif [ ${RETURN_CODE} -eq 1 ] ; then
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - Differences with expected output - ${BOLD}FAIL - FAIL${NORMAL}"
           diff -y "${0}".expected "${0}".out
    else
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - Test script ERROR - ${BOLD}FAIL - FAIL${NORMAL}"
    fi

   


    


#### To watch future updates in this repository select in the upper-right corner, the "Watch" list, and select Watching.

#### Author
[<img id="twitter" src="images/twitter.png" width="50" a="twitter.com/bradleyaustintx/">
](https://twitter.com/bradleyaustintx/)   [<img id="github" src="images/github.png" width="50" a="https://github.com/BradleyA/">
](https://github.com/BradleyA/)    [<img src="images/linkedin.png" style="max-width:100%;" >](https://www.linkedin.com/in/bradleyhallen)

#### System OS script tested
 * Ubuntu 14.04.3   LTS
 * Ubuntu 16.04.3-5 LTS (armv7l)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License
MIT License

Copyright (c) 2019  [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

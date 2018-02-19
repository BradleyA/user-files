# user-work-files
General user files when moving to a new system.

## Install one File

To download the latest commit of one of these files, for example .gitignore, change to the location you want to download.

    curl -L https://api.github.com/repos/BradleyA/user-work-files/tarball | tar -xzf - --wildcards BradleyA-user-work-files-*/.gitignore ; mv BradleyA-user-work-files-*/.gitignore . ; rmdir BradleyA-user-work-files-*/

## Clone

To clone, change to the location you want to download. Use git to pull or clone these files into the directory. If you do not have Git then enter; "sudo apt-get install git". On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/user-work-files.git
    cd user-work-files

## Files

.bashrc

.gitignore

.profile

.vimrc

.bash_aliases

.gitconfig

#### System OS script tested
 * Ubuntu 14.04.3 LTS
 * Ubuntu 16.04.3 LTS (armv7l)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License::

Permission is hereby granted, free of charge, to any person obtaining a copy of this software, associated documentation, and files (the "Software") without restriction, including without limitation of rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

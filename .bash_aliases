###
#	.bash_aliases  3.229.300  2019-07-30T13:00:45.455564-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.228  
#	   uncomment gst, gsts, gd aliases in .bash_aliases 
#	.bash_aliases  3.121.168  2019-02-07T10:46:55.086485-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.120  
#	   added gitlogl to search local repository to .bash_aliases 
#	.bash_aliases	1.1.19	2018-02-20_19:42:38_CST uadmin six-rpi3b.cptx86.com 1.0-13-g6d5681d 
#	   create gitlog alias in .bash_aliases 
##
#	git config --global --list
# GitHub download examples:
#	curl -L https://api.github.com/repos/BradleyA/markit/tarball | tar -xzf - --wildcards */markit ; mv BradleyA*/markit . ; rmdir BradleyA*/
#	git log --graph --decorate --abbrev
#	release number
#	curl --silent https://api.github.com/repos/BradleyA/markit/releases/latest | grep '"tag_name":'| sed -E 's/.*"([^"]+)".*/\1/'
#	curl https://api.github.com/repos/BradleyA/markit/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
#	download markit release 3.4
#	curl -o markit-3.4.tar -L https://api.github.com/repos/BradleyA/markit/tarball/3.4
#	download markit latest commit
#	curl -L -o markit.tar https://api.github.com/repos/BradleyA/markit/tarball
#	curl -L https://api.github.com/repos/BradleyA/markit/tarball/3.4 | tar -xzf - --wildcards */markit ; mv BradleyA*/markit . ; rmdir BradleyA*/
# Git Aliases examples from https://coderwall.com/p/_-ypzq/git-bash-fixing-it-with-alias-and-functions
#	alias g='git'
alias gst='git status'
alias gsts='git status -s'
alias gd='git diff'
#	alias gdc='git diff --cached'
#	alias gl='git pull'
#	alias gup='git pull --rebase'
#	alias gp='git push'
#	alias gd='git diff'
#	alias gc='git commit -v'
#	alias gc!='git commit -v --amend'
#	alias gca='git commit -v -a'
#	alias gca!='git commit -v -a --amend'
#	alias gcmsg='git commit -m'
#	alias gco='git checkout'
#	alias gcm='git checkout master'
#	alias gr='git remote'
#	alias grv='git remote -v'
#	alias grmv='git remote rename'
#	alias grrm='git remote remove'
#	alias grset='git remote set-url'
#	alias grup='git remote update'
#	alias grbi='git rebase -i'
#	alias grbc='git rebase --continue'
#	alias grba='git rebase --abort'
#	alias gb='git branch'
#	alias gba='git branch -a'
#	alias gcount='git shortlog -sn'
#	alias gcl='git config --list'
#	alias gcp='git cherry-pick'
#	alias glg='git log --stat --max-count=10'
#	alias glgg='git log --graph --max-count=10'
#	alias glgga='git log --graph --decorate --all'
#	alias glo='git log --oneline --decorate --color'
#	alias glog='git log --oneline --decorate --color --graph'
alias gitlog='git log --graph --decorate --oneline --color --stat'
#	check local repository
alias gitlogl='git log --graph --decorate --oneline --color --stat origin..HEAD'
#
#	alias ga='git add'
#	alias gm='git merge'
#	alias grh='git reset HEAD'
#	alias grhh='git reset HEAD --hard'
#	alias gclean='git reset --hard && git clean -dfx'
#	alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
#
#	alias gpoat='git push origin --all && git push origin --tags'
#	alias gmt='git mergetool --no-prompt'
#	
#	alias gg='git gui citool'
#	alias gga='git gui citool --amend'
#	alias gk='gitk --all --branches'
#	
#	alias gsts='git stash show --text'
#	alias gsta='git stash'
#	alias gstp='git stash pop'
#	alias gstd='git stash drop'
#	
#	# Will cd into the top of the current repository
#	# or submodule.
#	alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
#	
#	# Git and svn mix
#	alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
#	
#	alias gsr='git svn rebase'
#	alias gsd='git svn dcommit'
#	
#	# these alias commit and uncomit wip branches
#	alias gwip='git add -A; git ls-files --deleted -z | xargs -r0 git rm; git commit -m "--wip--"'
#	alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
#	
#	# these alias ignore changes to file
#	alias gignore='git update-index --assume-unchanged'
#	alias gunignore='git update-index --no-assume-unchanged'
#	# list temporarily ignored files
#	alias gignored='git ls-files -v | grep "^[[:lower:]]"'
#	# functions
#	# Will return the current branch name
#	# Usage example: git pull origin $(current_branch)
#	#
#	function current_branch() {
#	  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
#	  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
#	  echo ${ref#refs/heads/}
#	}
#	
#	function current_repository() {
#	  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
#	  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
#	  echo $(git remote -v | cut -d':' -f 2)
#	}
#	
#	# these aliases take advantage of the previous function
#	alias ggpull='git pull origin $(current_branch)'
#	alias ggpur='git pull --rebase origin $(current_branch)'
#	alias ggpush='git push origin $(current_branch)'
#	alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
#	
#	# Pretty log messages
#	function _git_log_prettily(){
#	  if ! [ -z $1 ]; then
#	    git log --pretty=$1
#	  fi
#	}
#	alias glp="_git_log_prettily"
#	
#	# Work In Progress (wip)
#	# These features allow to pause a branch development and switch to another one (wip)
#	# When you want to go back to work, just unwip it
#	#
#	# This function return a warning if the current branch is a wip
#	function work_in_progress() {
#	  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
#	    echo "WIP!!"
#	  fi
#	}
#	

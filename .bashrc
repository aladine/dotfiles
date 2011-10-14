#
# Your previous .profile  (if any) is saved as .profile.mpsaved
# Setting the path for MacPorts.

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
#
#Black       0;30     Dark Gray     1;30
#Blue        0;34     Light Blue    1;34
#Green       0;32     Light Green   1;32
#Cyan        0;36     Light Cyan    1;36
#Red         0;31     Light Red     1;31
#Purple      0;35     Light Purple  1;35
#Brown       0;33     Yellow        1;33
#Light Gray  0;37     White         1;37
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;37m\]"

#PS1="\n\033[0;31m\u@\h:\033[0;37m\w\033[0;32m \$(parse_git_branch)\n\033[0;0m> " 
#PS1="\n\u@\h:\w \$(parse_git_branch)\n> "
PS1="\n$RED\u@\h:\w $GREEN\$(parse_git_branch)$WHITE\n> "

alias '..'='cd ..'
alias '...'='cd .. && cd ..'
alias '....'='cd .. && cd .. && cd ..'

# Mail
alias mi="tail -f /var/log/mail.log"

# dmg to iso conversion
alias dmg2iso="hdiutil convert filename.dmg -format UDTO -o savefile.iso"

# Processes
alias tu="top -o cpu"
alias tm="top -o vsize"

# List files
alias ll="ls -al"

# Apache
alias ap="cd /private/etc/apache2"
alias apstop="sudo apachectl stop"
alias apstart="sudo apachectl start"
alias apgrace="sudo apachectl graceful"
alias aptest="sudo apachectl configtest"
alias apache_restart="apstop; apstart"
alias vhosts='sudo vi /etc/apache2/users/deploy.conf'

# Dito with hosts
alias hosts='sudo vi /etc/hosts'

alias bun="cd /Library/Application\ Support/TextMate/Bundles"
alias rebun="osascript -e 'tell app \"TextMate\" to reload bundles'"

# iTerm => TextMate communication
alias tu="textmate_urls"

# Ruby
alias att="autotest"

# Rails
alias rin="cd ~/code/rails_invoice"

# MySQL
alias mydb="mysql -udeploy -p invoice_development"
alias mysql_start="sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist"
alias mysql_stop="sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist"

# Environment
export PATH="/bin:/usr/bin:/sbin:/usr/sbin:~/bin:~/ruby/bin:/opt/local/bin:/opt/local/sbin"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH" 
export PATH="/Library/PostgreSQL/8.4/bin/:$PATH"
#export PATH="~/.rvm/bin/:$PATH"

export GEM_PATH="$GEM_PATH:~/jruby/lib/ruby/gems/1.8/gems/"
export LD_LIBRARY_PATH="/usr/local/lib"
export EDITOR="/usr/bin/vi"
export SVN_EDITOR=${EDITOR}
export GIT_EDITOR=${EDITOR}
export ARCHFLAGS="-arch x86_64"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes

# Git
alias gst="git status"
alias pull="git pull origin" 
alias pullm='git pull --rebase origin master'
alias pullo="git pull" 
alias push="git push origin" 
alias pusho="git push" 
alias commita="git commit -a -m " 
alias commit="git commit -m" 
alias undo="git reset --soft HEAD^"
alias status="git status" 
alias co="git checkout" 
alias coma="git checkout master" 
alias branch="git branch" 
alias merge="git merge --no-ff" 
alias remote="git remote"
alias gitprune="git remote prune origin" # remote branches were already deleted, so need to prune locals
alias gitd="git diff"
alias gitdc="git diff --cached"
alias gdc="git diff --cached"
alias oneline="git log --pretty=oneline"

# NYU Department of Radiology
alias nyu="cd ~/Sites/nyu/public"
alias nyucal="cd ~/Sites/nyu/public/nyu/calendar"
alias nyulog="tail -f /var/log/apache2/*log ~/Sites/nyu/log/*"

# bash completion support for core Git
source ~/.git-completion.bash
complete -o default -o nospace -F _git gh

# Postfix Load on Startup
# sudo launchctl load -w /System/Library/LaunchDaemons/org.postfix.master.plist

# JDK home
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"

alias ng="cd /opt/nginx/conf/sites-enabled"
alias ngconf='sudo vi /opt/nginx/conf/nginx.conf'
alias ngk='sudo /opt/nginx/sbin/nginx -s stop'
alias nglog='sudo tail -f /opt/nginx/logs/*.log'
alias ngr='sudo /opt/nginx/sbin/nginx -s reload'
alias ngs='sudo /opt/nginx/sbin/nginx'
alias nginx_restart='ngr'
alias nginx_start='ngs'
alias nginx_stop='ngk'

alias stuck="ps ax | sed '1p;/ [U] /!d'"

#alias wake_up_imac="wakeonlan 00:21:e9:64:fb:c5"
alias wake_up_imac="wakeonlan 00:1e:52:88:4b:cd" 

alias hist="history"
alias grh="history | grep "
alias gr="rake routes | grep "
alias snowgem='env ARCHFLAGS="-arch x86_64" gem '
alias mysqlgem='env ARCHFLAGS="-arch x86_64" gem install mysql2 --config-file bundler_config.yml'

alias wobo="cd ~/code/rentwb"
alias chrome="open /Applications/Google\ Chrome.app/"
alias firefox="open /Applications/Firefox.app/"
alias safari="open /Applications/Safari.app/"

alias pow_start="sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist"
alias pow_stop="sudo launchctl unload -w /Library/LaunchDaemons/cx.pow.firewall.plist"
alias pow_restart="pow_stop; pow_start"
alias powr="pow_restart"

alias it='ruby -I"lib:test" '

alias showallfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hideallfiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

alias purgequeue="for i in `mailq|grep '@' |awk {'print $1'}|grep -v '@'`; do postsuper -d $i ; done"

export NODE_PATH="/usr/local/lib/node"
#export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/lib/node_modules/npm/bin:$PATH"
export PATH="$PATH:/Users/chip/.rvm/gems/ruby-1.8.7-p334/bin"

export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'

stty erase 

alias calculator="/Applications/Calculator.app/Contents/MacOS/Calculator"
alias dropbox="/Applications/Dropbox.app/Contents/MacOS/Dropbox"
alias evernote="/Applications/Evernote.app/Contents/MacOS/Evernote"
alias firefox="/Applications/Firefox.app/Contents/MacOS/Firefox"
alias github="/Applications/GitHub.app/Contents/MacOS/Github"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias preview="/Applications/Preview.app/Contents/MacOS/Preview"
alias propane="/Applications/Propane.app/Contents/MacOS/Propane"
alias quicktime="/Applications/QuickTime\ Player.app Contents/MacOS/QuickTime\ Player"
alias safari="/Applications/Safari.app/Contents/MacOS/Safari"
alias skype="/Applications/Skype.app/Contents/MacOS/Skype"
alias twitter="/Applications/Twitter.app/Contents/MacOS/Twitter"
alias utils="/Applications/Utilities/Contents/MacOS/Utilities"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias scan="/Applications/VueScan.app/Contents/MacOS/VueScan"
alias iphoto="/Applications/iPhoto.app/Contents/MacOS/iPhoto"
alias iterm="/Applications/iTerm.app/Contents/MacOS/iTerm"
alias itunes="/Applications/iTunes.app/Contents/MacOS/iTunes"
alias iwork="/Applications/iWork\ '09/Contents/MacOS/iWork\ '09"
alias namebench="/Applications/namebench.app/Contents/MacOS/namebench"
alias pomodoro="/Applications/pomodoro.app/Contents/MacOS/pomodoro"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

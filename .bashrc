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
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'

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

# Ssh
#alias slice="ssh -p 30000 deploy@slice"
alias scpp="scp -p 30000 deploy@slice"
#alias imac="ssh chip@imac"
alias sb="ssh chip@sandalbeach.dyndns.org"

# Ssh for 2nd Slicehost server which will run the new NYU scheduler, chipcastle.com, acclaimplaza.com.
alias nyud="ssh -P 30000 deploy@nyudemo"
#alias slice2="ssh -p 30000 deploy@209.20.64.252"

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

# MySQL
alias mydb="mysql -udeploy -pMysqlFreak invoice_development"
alias mysql_start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql_stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias fix_mysql="sudo install_name_tool -id /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/local/mysql/lib/libmysqlclient.dylib"

# PostgreSQL
alias postgres_start="launchctl load -w ~/Library/LaunchAgents/postgres.plist"
alias postgres_stop="launchctl unload -w ~/Library/LaunchAgents/postgres.plist"

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
alias ptags='git push --tags'
alias tags='git tag -n'
alias gb="git branch"
alias stash="git stash"

#
# Woody's books
#
# buyingbot.com (aka staging_development)
alias stagingwb='ssh wbrent@10.180.82.250'
alias staging='ssh staging'

# coopersbooks.com (aka live_development)
alias deployqa='cap qa deploy:migrations'
alias qawb='ssh wbrent@10.180.76.56'
alias qa='ssh qa'

# rentbooks.com (aka production) 
alias coprod="git co production"
alias pullprod='git pull origin production'
alias pushprod='git push origin production'
alias deployprod='cap production_all deploy:migrations'
alias prodwb='ssh wbrent@10.181.237.243'
alias prod2wb='ssh wbrent@10.181.229.243'
alias prod3wb='ssh wbrent@10.181.225.242'
alias prod4wb='ssh wbrent@10.181.230.22'
alias prod5wb='ssh wbrent@10.181.230.111'
alias prod='ssh prod'
alias prod2='ssh prod2'
alias prod3='ssh prod3'
alias prod4='ssh prod4'
alias prod5='ssh prod5'
alias prod-db-backup='ssh prod-db-backup'

alias solr1='ssh root@10.181.229.77'
alias solr2='ssh root@10.181.236.22'
alias solr3='ssh root@10.181.228.99'

export HUBOT_CAMPFIRE_TOKEN="5c1b73a535c803ede9a097838b5a0e05eb6c0f50"
export HUBOT_CAMPFIRE_ROOMS="142016"
export HUBOT_CAMPFIRE_ACCOUNT="ccdc"
export HUBOT_JENKINS_URL="http://10.180.82.250:8080"


# NYU Department of Radiology
alias nyu="cd ~/Sites/nyu/public"
alias nyucal="cd ~/Sites/nyu/public/nyu/calendar"
alias nyulog="tail -f /var/log/apache2/*log ~/Sites/nyu/log/*"

# bash completion support for core Git
source ~/.git-completion.bash
complete -o default -o nospace -F _git gh

# Postfix Load on Startup
alias postfix_start="sudo launchctl load -w /System/Library/LaunchDaemons/org.postfix.master.plist"

# Postgres SQL start
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# JDK home
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"

# Nginx
alias ng='cd /opt/nginx'
alias ngconf='ng; sudo vi conf/nginx.conf'
alias nglog='ng; tail -f logs/*.log'
alias ngs='launchctl load -F /System/Library/LaunchDaemons/nginx.plist'
alias ngk='launchctl unload -F /System/Library/LaunchDaemons/nginx.plist'
alias nginx_start='ngs'
alias nginx_stop='ngk'

# invoicethat
alias rin="cd ~/code/rails_invoice"
alias rinstart='passenger start --socket /tmp/invoicethat.local.socket -d'
#alias rinstart='rin && bundle exec unicorn -c /Users/chip/code/rails_invoice/shared/config/unicorn.rb -E development -D'
#alias rinstop="ps -U chip | grep unicorn | grep invoice | cut -d ' ' -f 1 | while read pid; do echo \"kill -9 $pid\" && kill -9 $pid; done"

alias stuck="ps ax | sed '1p;/ [U] /!d'"

alias wake_up_imac="wakeonlan 00:1e:52:88:4b:cd" 

alias hist="history"
alias grh="history | grep "
alias gr="rake routes | grep "
alias snowgem='env ARCHFLAGS="-arch x86_64" gem '
alias mysqlgem='env ARCHFLAGS="-arch x86_64" gem install mysql2 --config-file bundler_config.yml'

alias wobo="cd ~/Desktop/code/rentwb"
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

# Environment
export GEM_HOME="/Users/chip/.rvm/gems/ruby-1.8.7-p352"
export GEM_PATH="$GEM_PATH:~/jruby/lib/ruby/gems/1.8/gems/"
export LD_LIBRARY_PATH="/usr/local/lib"
export EDITOR="/usr/bin/vi"
export SVN_EDITOR=${EDITOR}
export GIT_EDITOR=${EDITOR}
export ARCHFLAGS="-arch x86_64"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes
export PATH="/bin:/usr/bin:/sbin:/usr/sbin:~/bin:~/ruby/bin:/opt/local/bin:/opt/local/sbin"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH" 
export PATH="/Library/PostgreSQL/8.4/bin:$PATH"
export PATH="/usr/X11/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export PATH="/usr/local/lib/node_modules/npm/bin:$PATH"
export PATH="$PATH:/Users/chip/.rvm/gems/ruby-1.8.7-p334/bin"
export PATH="./bin:$PATH"
export CLICOLOR=1
export GITHUB_USER='chip'
export GITHUB_PASSWORD='Hedu0910'

alias spn="rake spec:no_rails"

function encode() { echo -n $@ | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'; }
function google() { chrome http://www.google.com/search?hl=en#q="`encode $@`" ;}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

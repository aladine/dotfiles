# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chip"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/phantomjs-1.7.0-macosx/bin:./bin:/usr/X11/bin:/Library/PostgreSQL/8.4/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:~/bin:~/ruby/bin:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin

# Mail
alias mi="tail -f /var/log/mail.log"

# dmg to iso conversion
alias dmg2iso="hdiutil convert filename.dmg -format UDTO -o savefile.iso"

# Processes
alias tu="top -o cpu"
alias tm="top -o vsize"

# List files
alias ll="ls -al"
alias l="ls -al"

# Ssh for 2nd Slicehost server which will run the new NYU scheduler, chipcastle.com, acclaimplaza.com.
alias nyud="ssh -P 30000 deploy@nyudemo"

# Dito with hosts
alias hosts='sudo vi /etc/hosts'

# MySQL
alias mydb="mysql -udeploy -pMysqlFreak invoice_development"
alias mysql_start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql_stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias fix_mysql="sudo install_name_tool -id /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/local/mysql/lib/libmysqlclient.dylib"

# PostgreSQL
alias postgres_start="launchctl load -w ~/Library/LaunchAgents/postgres.plist"
alias postgres_stop="launchctl unload -w ~/Library/LaunchAgents/postgres.plist"

# Git
alias g="git status"
alias gst="echo 'Use g instead' && git status"
alias pull="git pull origin"
alias pullm='git pull --rebase origin master'
alias pullr="git pull"
alias push="git push origin"
alias pushr="git push"
alias c="git commit -m "
alias ca="git commit -a -m "
alias commita="echo 'Use ca instead' && git commit -a -m "
alias commit="echo 'Use c instead' && git commit -m"
alias undo="git reset --soft HEAD^"
alias status="git status"
alias co="git checkout"
alias coma="git checkout master"
alias branch="git branch"
alias merge="git merge --no-ff"
alias remote="git remote"
alias gitprune="git remote prune origin" # remote branches were already deleted, so need to prune locals
alias gd="git diff"
alias gitd="echo 'Use gd instead' && git diff"
alias gitdc="git diff --cached"
alias gdc="git diff --cached"
alias oneline="git log --pretty=oneline"
alias ptags='git push --tags'
alias tags='git tag -n'
alias gb="git branch"
alias stash="git stash"
alias a="ag"
alias v="vim"

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
alias coprod="co production"
alias pullprod='pull production'
alias pushprod='push production'
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

alias port3000='curl https://raw.github.com/gist/46c61e6977fcb4db7abf/20e862928e863c7610157e4d9e80b976247f5e0d/gistfile1 | patch -p0'

export HUBOT_CAMPFIRE_TOKEN="5c1b73a535c803ede9a097838b5a0e05eb6c0f50"
export HUBOT_CAMPFIRE_ROOMS="142016"
export HUBOT_CAMPFIRE_ACCOUNT="ccdc"
export HUBOT_JENKINS_URL="http://10.180.82.250:8080"


# NYU Department of Radiology
alias nyu="cd ~/Sites/nyu/public"
alias nyucal="cd ~/Sites/nyu/public/nyu/calendar"
alias nyulog="tail -f /var/log/apache2/*log ~/Sites/nyu/log/*"

# Postfix Load on Startup
alias postfix_start="sudo launchctl load -w /System/Library/LaunchDaemons/org.postfix.master.plist"

# Postgres SQL start
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# JDK home
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"

alias code="cd ~/code"

# invoicethat
alias rin="cd ~/code/rails_invoice"
alias rinstart='passenger start --socket /tmp/invoicethat.local.socket -d'

alias stuck="ps ax | sed '1p;/ [U] /!d'"

alias snowgem='env ARCHFLAGS="-arch x86_64" gem '
alias mysqlgem='env ARCHFLAGS="-arch x86_64" gem install mysql2 --config-file bundler_config.yml'

alias wobo="cd ~/code/woboinc/rentwb"
alias chrome="open /Applications/Google\ Chrome.app/"
alias firefox="open /Applications/Firefox.app/"
alias safari="open /Applications/Safari.app/"

alias spn="rake spec:no_rails"

alias ctags="`brew --prefix`/bin/ctags"
alias gtag="git tag -a `date -u \"+UTC_%Y%m%d%H%M%S\"`"

alias tree="tree -C"

alias spec="~/bin/spec.sh"
alias bi='bundle install --path .bundle/gems --binstubs .bundle/bin'
alias be='bundle exec'

# Environment
export GEM_PATH="$GEM_PATH:~/jruby/lib/ruby/gems/1.8/gems/"
export LD_LIBRARY_PATH="/usr/local/lib"
export EDITOR="/usr/bin/vim -f"
export SVN_EDITOR=${EDITOR}
export GIT_EDITOR=${EDITOR}
export ARCHFLAGS="-arch x86_64"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes
export CLICOLOR=1
export GITHUB_USER='chip'
export GITHUB_PASSWORD='Hedu0910'
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

function encode() { echo -n $@ | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'; }
function commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}

function vgit() { vim `git status -s | cut -d ' ' -f 3` }

alias topten="history | commands | sort -rn | head"

# vim bindings for the command line
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

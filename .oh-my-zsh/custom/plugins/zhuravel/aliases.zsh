# Rake tasks
alias ptt='rake parallel:test'
alias pts='rake parallel:spec'
alias combo='rake db:migrate parallel:migrate db:schema:dump'

# Shortcuts
alias m='mate .'
alias s='subl .'
alias o='open'
alias oo='open .'

# A very simple and useful stopwatch (return or ctrl-d to stop)
alias stopwatch='time ( read )'
# Simple calculator ( calc 2*2 => 4 )
alias calc='bc <<<'
# Easily search running processes
alias 'ps?'='ps ax | grep '

# Databases
alias mysql='mysql -u root'
alias mysql-top='watch -n 1 mysqladmin --user=root processlist'
alias mysql-dir='cd /usr/local/var/mysql/'
alias psql='psql -U bohdan postgres'
alias redis-status='redis-cli ping'
for dbname in mysql postgresql couchdb redis; do
  eval "$dbname-stop() { launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.$dbname.plist }
        $dbname-start() { launchctl load ~/Library/LaunchAgents/homebrew.mxcl.$dbname.plist }
        $dbname-restart() { echo 'Restarting $dbname...'; $dbname-stop 2>/dev/null; $dbname-start }"
done
unset dbname

alias prevent-sleep='pmset noidle'
alias eye='sudo opensnoop'

alias gzip='gzip -9n' # Set strongest compression level as ‘default’ for gzip
alias ping='ping -c 5' # Ping 5 times ‘by default’
alias ql='qlmanage -p 2>/dev/null' # Preview a file using QuickLook

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ips6="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

# Get OS X Software Updates, and update oh-my-zsh, Pow, installed Ruby gems, Homebrew, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; sudo gem update; upgrade_oh_my_zsh; powder update'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

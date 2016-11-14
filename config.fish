#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my FISH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#
#  ---------------------------------------------------------------------------


#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

set -gx ANDROID_HOME /Users/daniel.tome/Library/Android/sdk
set -gx ANDROID_PATH $ANDROID_HOME
set -gx ANDROID_SDK $ANDROID_HOME
set -gx ANT_HOME /Users/daniel.tome/apache-ant-1.9.4
set -gx DROPBOX_BIN /Users/daniel.tome/Dropbox/bin
set -gx GITINSPECTOR_BIN /Users/daniel.tome/Applications/gitinspector

set -U fish_user_paths $GITINSPECTOR_BIN $DROPBOX_BIN $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANT_HOME/bin /usr/local/mysql/bin /usr/local/sbin $fish_user_paths


#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias show_options='shopt'                  # Show_options: display bash options settings
alias df='df -h'                            # df should be human readable ;-)
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e $PATH//:/\\n'           # path:         Echo all executable Paths
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

function cd --description "Always list directory contents upon 'cd'"
  builtin cd "$argv"; ls;
end
function trash  --description "Moves a file to the MacOS trash"
  mv "$argv" ~/.Trash ;
end


#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------
 
function zipf --description "To create a ZIP archive of a folder"
  zip -r "$1".zip "$1" ;
end
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make100mb='mkfile 100m ./100MB.dat'   # make100mb:    Creates a file of 100mb size (all zeros)


#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                    # qfind:    Quickly search for file
function ff --description "Find file under the current directory"
  /usr/bin/find . -name "$argv" ; 
end
function ffs --description "Find file whose name starts with a given string"
  /usr/bin/find . -name "$argv"'*' ; 
end
function ffe --description "Find file whose name ends with a given string"
  /usr/bin/find . -name '*'"$argv" ; 
end
function spotlight  --description "Search for a file using MacOS Spotlight's metadata"
  mdfind "kMDItemDisplayName == '$argv'wc"; 
end

#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

function findPid --description "find out the pid of a specified process" 
  lsof -t -c "$argv" ;
end
#  Note that the command name can be specified via a regex
#  E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#  Without the 'sudo' it will only find processes of the current user
#  -----------------------------------------------------


#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'


#   ---------------------------
#   6.  NETWORKING
#   ---------------------------
 
alias myip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com' # myip:  Public facing IP 
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
 
#   ---------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------
 
 
#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
 
#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
  
#   startSaver: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
alias startSaver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------
 
alias editHosts='edit /etc/hosts'                       # editHosts:        Edit /etc/hosts file
alias apacheEdit='edit /etc/httpd/httpd.conf'           # apacheEdit:       Edit httpd.conf
alias apacheLog='tail /var/log/httpd/error_log'         # apacheLog:        Tails HTTP error 
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias apacheTest='sudo apachectl -t'                    # apacheTest:       Check Apache Syntax
alias mysqlStart='sudo /usr/local/mysql/support-files/mysql.server start'       # mysqlStart:       Start Mysql server
alias mysqlStop='sudo /usr/local/mysql/support-files/mysql.server stop'         # mysqlStop:        Stop Mysql server
alias mysqlRestart='sudo /usr/local/mysql/support-files/mysql.server restart'   # mysqlRestart:     Restart Mysql server
alias downloadSite='wget --mirror --convert-links --backup-converted --adjust-extension ' # download a site for offline reading. UsagE: downloadSite http://somesite.com

# Drupal Build and Launch Tools
function blt --description "BLT function for the fish shell"
    if test -n (git rev-parse --show-cdup)
        set --global GIT_ROOT (git rev-parse --show-cdup)
    else
        set --global GIT_ROOT "."
    end

    if test -f $GIT_ROOT/vendor/bin/blt
        eval $GIT_ROOT/vendor/bin/blt $argv
    else
        echo "You must run this command from within a BLT-generated project repository."
    end
end
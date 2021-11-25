# .bashrc

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export HISTCONTROL="ignoreboth"   #dont put duplicate and leading spaces
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S ' # save time to history
export HISTFILESIZE=10000

# User specific aliases and functions
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some example alias instructions
alias who_con_port='lsof -i -P -n'
alias who_lis_port='netstat -lptn'

alias df='df -P'
alias sqlplus='rlwrap -b "" -f $UBIN/sql.dict sqlplus'
alias rman='rlwrap -b "" -f $UBIN/rman.dict rman'
alias dstatd='dstat -c -d -D sda,sdb,sdc,sdd,sde,cciss/c0d0,cciss/c0d3,cciss/c0d1,cciss/c0d2 -g -n'
alias ctop="ps -efo pcpu,pid,ppid,user,comm,args | grep -v "0.00" | sort -r | head -5"
alias vi='vim'
alias psbot='ps -ef | grep [c]yber_dbabot'
alias psas='ps -ef | grep [a]lerts_server'
alias psad='ps -ef | grep [a]lerts_admin'

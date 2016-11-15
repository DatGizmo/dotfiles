function finder()                                                                               
{                                                                                               
    search=$1                                                                                   
    path=$2                                                                                     
    [ -z $path ] && path="."                                                                    
    echo Search for $search in $path                                                            
    find $path -iname "*$search*"                                                               
}
function baseget()
{
    wget http://10.0.0.2/base-feeds.conf.$1
    mv base-feeds.conf.$1 base-feeds.conf
}
function getinput()
{
	wget http://10.0.0.2/.inputrc
	bind -f ~/.inputrc
}
alias getbase='baseget'
alias geti='getinput'
alias findn='finder'
alias journalctl='journalctl --no-pager'
alias systemctl='systemctl --no-pager'
alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
alias grep='grep --colour=auto'
alias rmrw='mount -o remount,rw /'
alias rmro='mount -o remount,ro /'
alias mountHost='mount -t nfs -o nfsvers=3 10.0.0.2:/development/tftpboot /mnt'
PS1='\[\033[01;34m\]\w \n\[\033[01;30m\]\h \[\033[01;33m\]\$\[\033[00m\] '
PATH=$PATH:${HOME}/bin
export DISPLAY=:0
IFS=$';\x1B[' read -p $'\x1B7\x1B[r\x1B[999;999H\x1B[6n\x1B8' -d R -rst 1 _ _ LINES COLUMNS _ </dev/tty && echo cols $COLUMNS rows $LINES && stty cols $COLUMNS rows $LINES

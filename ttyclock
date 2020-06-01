# Terminal Clock
# ver.1
stty -echo
printf "\x1b[0m"

clockStr=
showDate=1
exitFromScript=
delay=0.001
standard=0

if [[ $1 = "-c" ]]
then
    # Color
    if [[ $2 = "" ]] || [[ $2 = "0" ]]
    then
        clockStr=""
    elif (( $2 < 10 ))
    then
        clockStr="\x1b[3${2}m"
    else
        echo "ttyclock: invalid value for: color"
        exit 2
    fi

    if [[ $3 = "-d" ]]
    then
        if [[ $4 = "0" ]]
        then
            showDate=0
            delay=0.0001
        elif [[ $4 = "1" ]]
        then
             showDate=1
             delay=0.01
        else
            echo "ttyclock: invalid value for: showDate"
            exit 2
        fi
    fi
elif [[ $1 = "-h" ]]
then
    echo "TTY-Clock, ver.1"
    echo "     Help      "
    echo
    echo "Usage:" 
    echo "       ttyclock -h"
    echo "       ttyclock -s"
    echo "       ttyclock [-c 0-9] [-d 0|1]"
    echo
    exit 0
elif [[ $1 = "-s" ]]
then
    standard=1
    showDate=0
else
    echo "ttyclock: invalid argument"
    echo "to see the help, use option -h"
    exit 3
fi

until [[ $exitFromScript = "q" ]]
do
    clear
    curtime=`date +%H:%M:%S`
    curdate=`date "+%a, %d.%m.%Y"`

    if (( standard > 0 )); then
        echo "$curtime"
    else
        printf "   \x1b[1m${clockStr}${curtime}\x1b[0m    \n"
    fi
    if (( showDate > 0 )); then
        printf "${curdate}\n"
    fi
    read -n 1 -t $delay exitFromScript
done

stty echo
clear
exit 0

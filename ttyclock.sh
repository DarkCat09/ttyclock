# Terminal Clock
# ver.1
stty -echo

clockStr=
exitFromScript=

if [[ $1 = "" ]] || [[ $1 = "0" ]]
then
clockStr=""
elif [[ $1 = "1" ]]
then
clockStr="\x1b[3m"
fi

until [[ $exitFromScript = "q" ]]
do
clear
curtime=`date +%H:%M:%S`
curdate=`date +%a, +%d.%m.%Y`
printf " \x1b[1m${clockStr}${curtime}\x1b[0m \n"
printf "${curdate}\n"
read -n 1 -t 0.01 exitFromScript
done
stty echo

echo $1

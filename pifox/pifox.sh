#!/bin/bash

#PiFox by KM4EFP

foxversion=113

foxdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
config=$foxdir/fox.cfg

if [[ "$1" == autofoxoff ]]; then
sed -i "s/Autofox.*/Autofox=0/" $config
fi

if [[ "$1" == killfox ]]; then
pkill -f pifox.sh
fi

if [ -f $config ];
then
source $config
fi

if [[ -f $config && $Foxver = $foxversion ]];
then
echo "'Loading $config'"

else

if [ -f $config ];
then
mv -f $config $foxdir/oldfox.cfg
echo "Pifox is backing up old settings and preparing new version of the file..."
fi

echo "Creating default config at '$config'"
echo "Foxver=$foxversion">>$config
echo "Callsign=YourCallSign">>$config
echo "Message=TransmittedMessage">>$config
echo "Foxtime=1">>$config
echo "Autofox=0">>$config
echo "Foxbutton=0">>$config
echo "Vox=1">>$config
echo "Voice=1">>$config
echo "Packet=0">>$config
echo "Frequency=146.565">>$config
echo "Interval=60">>$config
echo "Plays=0">>$config
echo "ppM=-21">>$config
echo "Deviation=5">>$config
echo "Preemphasis=400">>$config
echo "Tone=0">>$config
echo "ToneFreq=110.9">>$config
echo "Power=7">>$config
fi

source $config
if [[ "$Autofox" == 0 ]]; then
echo "pifox - $foxversion

This is an interactive script by KM4EFP to control, configure, and deploy a fox hunt transmitter and is based on a script by fotograf_ale from Yahoo group Raspberry_Pi_4-Ham_RADIO to control nbfm by IK1PLD.  The Festival package is required for text to speech and WiringPi package is required for GPIO use.  When using HAM frequencies a license is required by the FCC.  If using nbfm and your pi's GPIO4(pin7) as a transmitter a low pass or band pass filter is required.  For this reason vox is used by default with an external handheld radios mic connected to Pis audio out.  To use GPIO 4 on Pi as a transmitter you must set vox to 0 in settings.

The authors of this script are not responsible for how you may use or misuse this script or its use in general.  Please research all applicable laws in your area before attempting to run script.
"
read -p "Press any key to continue..."

clear

while [ answer != "0" ]
do
clear
echo "pifox - $foxversion"
echo "Select from the following functions:"
echo "  0    Run fox script"
echo "  1    Load default settings"
echo "  2    Edit current settings"
echo "  3    Display current settings"
echo "  4    Automatically run at boot"
echo "  5    Remove from boot"
echo "  6    Close program"
read -p " ?" answer
case $answer in
0)
break
;;
1)
echo "Callsign: Input your ham callsign."
read new11
sed -i "s/Callsign.*/Callsign=$new11/" $config

echo "Message: Message to transmit."
read new12
sed -i "s/Message.*/Message='$new12'/" $config

echo "Loading default settings..."

sed -i "s/Foxtime.*/Foxtime=1/" $config
sed -i "s/Autofox.*/Autofox=0/" $config
sed -i "s/Foxbutton.*/Foxbutton=0/" $config
sed -i "s/Vox.*/Vox=1/" $config
sed -i "s/Voice.*/Voice=1/" $config
sed -i "s/Packet.*/Packet=0/" $config
sed -i "s/Frequency.*/Frequency=146.565/" $config
sed -i "s/Interval.*/Interval=60/" $config
sed -i "s/Plays.*/Plays=0/" $config
sed -i "s/ppM.*/ppM=-21/" $config
sed -i "s/Deviation.*/Deviation=5/" $config
sed -i "s/Preemphasis.*/Preemphasis=400/" $config
sed -i "s/Tone=.*/Tone=0/" $config
sed -i "s/ToneFreq.*/ToneFreq=110.9/" $config
sed -i "s/Power.*/Power=7/" $config
cat $config
read -p "Default settings loaded.  Press any key."
;;

2)
echo "Edit settings:"
echo "For many settings 0 is OFF / 1 is ON
Do not leave any line blank you must manually input all settings"

echo "Callsign: Input your ham callsign."
read new11
sed -i "s/Callsign.*/Callsign=$new11/" $config

echo "Message: Message to transmit."
read new12
sed -i "s/Message.*/Message='$new12'/" $config

echo "Foxtime: Transmit the current time at end of message.  On is 1 and off is 0.  Default is 1"
read new13
sed -i "s/Foxtime.*/Foxtime=$new13/" $config

echo "Autofox: Bypasses menus and transmits automatically with current settings when script is ran.  This is useful for deploying in the field where connecting to Pi  may not be convenient.  To disable autofox run \"sudo ./pifox.sh autofoxoff\"  Default is 0"
read new1
sed -i "s/Autofox.*/Autofox=$new1/" $config

echo "Foxbutton: Turn transmission on and off via a pull-up resistor on an on/off button or a switch via GPIO23 aka pin 16.  Default is 0"
read new15
sed -i "s/Foxbutton.*/Foxbutton=$new15/" $config

echo "Vox: Uses audio out on Pi to trigger vox on a handheld radio instead of using GPIO 4 pin 7 as antenna.  Set this to 0 to use Pi GPIO 4 pin 7 and a piece of wire as transmitter. For testing default is 1"
read new2
sed -i "s/Vox.*/Vox=$new2/" $config

echo "Voice: Transmits voice mode.  Default is 1"
read new17
sed -i "s/Voice.*/Voice=$new17/" $config

echo "Packet: Transmits packet radio mode.  Callsign and Message must be all uppercase.  Default is 0"
read new18
sed -i "s/Packet.*/Packet=$new18/" $config

echo "Frequency: Frequency to transmit on.  Default is 146.565"
read new3
sed -i "s/Frequency.*/Frequency=$new3/" $config

echo "Interval: This is the duration between transmission in seconds.  Default is 60"
read new4
sed -i "s/Interval.*/Interval=$new4/" $config

echo "Plays: Number of times to transmit fox. 0 equals infinite.  Default is 0"
read new16
sed -i "s/Plays.*/Plays=$new16/" $config

echo "ppM: Set the ppM of your own device.  Default is -21"
read new5
sed -i "s/ppM.*/ppM=$new5/" $config

echo "Deviation: Set the deviation.  Default is 5."
read new6
sed -i "s/Deviation.*/Deviation=$new6/" $config

echo "Preemphasis: Set the preemphasis in microseconds.  Default is 400"
read new7
sed -i "s/Preemphasis.*/Preemphasis=$new7/" $config

echo "Tone: Enable PL Tone.  Default is 0"
read new8
sed -i "s/Tone=.*/Tone=$new8/" $config

echo "Tone Frequency: Set the tone frequency in Hz.  Default is 110.9"
read new9
sed -i "s/ToneFreq.*/ToneFreq=$new9/" $config

echo "Power: Set the transmit power level as 0-7. Default is 7"
read new10
sed -i "s/Power.*/Power=$new10/" $config
cat $config
read -p "Settings have been updated.  Press any key."
;;

3)
echo "Current config:"
cat $config
read -p "Press any key to continue"
;;

4)
echo "Adding pifox to run automatically on boot, setting for autofox will also be set to 1. To disable autofox run \"sudo ./pifox.sh autofoxoff\" to stop fox from transmitting run \"sudo ./pifox.sh killfox\" to remove from boot run program and select Remove From Boot.
"

foxdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cronjob="@reboot sudo $foxdir/pifox.sh"

sed -i "s/Autofox.*/Autofox=1/" $config

crontab -l -u $USER | echo "$cronjob" | crontab -u $USER -

read -p "Press any key to continue"
;;

5)
echo "Deleting crontab entry from startup.  To stop fox from transmitting run \"sudo ./pifox.sh killfox\" or reboot. "

crontab -l -u $USER | sed -i "s/.*pifox.sh//" | crontab -u $USER -

read -p "Press any key to continue"
;;

6)
exit 0
break
;;

esac
done
fi

source $config

callsign=$Callsign
foxmessage=$Message
foxbutton=$Foxbutton
foxtimeset=$Foxtime
foxvoice=$Voice
foxpacket=$Packet
foxcount=$Plays
inp1=$Frequency
inp2=$Interval
inp3=$ppM
inp4=$Deviation
inp5=$Preemphasis
inp6=$Tone
inp7=$ToneFreq
inp8=$Power

#creates a 10MB RamDisk
if [ ! -e /mnt/ramdisk ]; then
     mkdir -p /mnt/ramdisk
fi
mount -t ramfs -o size=10m ramfs /mnt/ramdisk

cd $foxdir
cp nbfm /mnt/ramdisk/nbfm
cp pifox.sh /mnt/ramdisk/pifox.sh
cp pkt2wave /mnt/ramdisk/pkt2wave

cd /mnt/ramdisk

rm -f fox.txt
rm -f fox_pkt.txt

#activates GPIO22 port (pin15) as pull-upped Input
#you can choose any available ports you wish and use them as signal inputs or alarms
gpio -g mode 22 up

#activates GPIO17 port (pin11) as output to light on a led indicating RF output or to switch amplifiers, filters etc.
gpio -g mode 17 out
gpio -g write 17 0

clear

echo "Time to setup the hunt!"
echo "
Format of transmission is '\$callsign \$foxmessage at \$time'
"

echo ""
echo "Fox is transmitted on $inp1 MHz every $inp2 seconds"
echo "A logger file named /mnt/ramdisk/Logger.txt is also temporary saved onto the ramdisk"
echo ""

count=0

while :
do

if [[ "$foxbutton" == 1 ]]; then
echo "Waiting for fox button ... "
#Gpio23 aka pin 16 as pullup resistor
button=23
gpio -g mode $button up
while [ `gpio -g read $button` = 1 ];
do
sleep 0.1
done
echo "Fox button detected... preparing to transmit."
fi

	Time=$(date +"%R %p")
	Seconds=$(date +"%S")
	Day=$(date +"%F")
    GPIO22=$(gpio -g read 22)	

if [[ "$foxtimeset" == 1 ]]; then
	echo "${callsign} ${foxmessage} at ${Time}" >> fox.txt
	echo "${callsign}>BEACON:${foxmessage} at ${Time}" >> fox_pkt.txt
fi

if [[ "$foxtimeset" == 0 ]]; then
	echo "${callsign} ${foxmessage}" >> fox.txt
	echo "${callsign}>BEACON:${foxmessage}" >> fox_pkt.txt
fi

    if [ $GPIO22 == 0 ]; then 
        #chech the GPIO22 as input for signals or alarms, and modify the following text as you wish
        echo " . Input 22 active!!!" >> fox.txt
		echo ". Input 22 active!!!" >> fox_pkt.txt
    fi	
	
	echo "${Day};${Time}:${Seconds};${callsign};${foxmessage};${GPIO22};" >> Logger.txt
    cat fox.txt

	#the following line is to generate the voice audio file

if [[ "$foxvoice" == 1 ]]; then
		text2wave fox.txt -F 22500 -o fox.wav
fi

	#the following line is to generate the packet radio audio file

if [[ "$foxpacket" == 1 ]]; then
		./pkt2wave fox_pkt.txt -n 1 -r 44100 -o fox_pkt.wav
fi

gpio -g write 17 1


if [[ "$Vox" == 1 ]]; then

if [[ "$foxvoice" == 1 ]]; then
		aplay fox.wav
fi

if [[ "$foxpacket" == 1 ]]; then
		aplay fox_pkt.wav
fi

fi

if [[ "$Vox" == 0 ]]; then

if [[ "$foxvoice" == 1 ]]; then
		./nbfm fox.wav $inp1 22500 $inp3 $inp4 $inp5 $inp6 $inp7 $inp8
fi

if [[ "$foxpacket" == 1 ]]; then
		./nbfm fox_pkt.wav $inp1 44100 $inp3 $inp4 $inp5 $inp6 $inp7 $inp8
fi

fi

gpio -g write 17 0
rm -f fox.txt
rm -f fox_pkt.txt

count=$((count+1))
echo "
Transmission count: $count
"
if [ $count = $foxcount ];
then
break
fi

sleep $inp2

done

echo ""
echo "End of transmissions."
exit
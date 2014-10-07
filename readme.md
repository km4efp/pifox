pifox v113
-
pifox is a script written by KM4EFP to configure, control, and deploy a fox hunt transmitter.  It is based on a script by fotograf_ale from Yahoo group Raspberry_Pi_4-Ham_RADIO to control nbfm by IK1PLD.  Schematics were made using electronic circuit design spen.

A fox hunt transmitter, typically referred to as a fox, is a radio transmitter usually playing a looped message that is hidden with the intention of being found using radio direction finding techniques and equipment.  They are typically meant for members of a club to find and contests are held to see who can be the first to find the fox.

-----

Installation
-

The Festival package is required for text to speech and WiringPi package is required for GPIO use.

1. Update Pi and install git, festival, and wiringpi package
-

Update Pi

"sudo apt-get update"

"sudo apt-get upgrade"

-----

Install Git on your Pi.

"sudo apt-get install git-core"

-----

Install festival

"sudo apt-get install festival"

-----

Install wiringPi

http://wiringpi.com/download-and-install/

2. Download pifox
-

Make a pifox directory in home

"cd ~"

"mkdir pifox"

"cd pifox"

-----

then download pifox

"git clone git://github.com/km4efp/pifox.git"

-----

updating pifox

"cd ~/pifox"

"git pull"

3. chmod +x all files
-

"cd ~/pifox/pifox"

"sudo chmod +x *"

4. Run pifox
-

"sudo ./pifox.sh"

5. Configure your settings
-

Either select the menu option to load the default settings which prompts to input callsign and message or for more control select edit settings to take full advantage of the script.  A detailed description of each setting can be found later in readme.

Leave nothing blank!
You must manually input all settings.

When using HAM frequencies a license is required by the FCC.  If using nbfm and your pi's GPIO4(pin7) as a transmitter a low pass or band pass filter is required.  For this reason vox is used by default with an external handheld radio's mic connected to Pi's audio out usually by use of an appropriately sized audio cable.  This way you set the vox on your radio to detect Pi's audio out and your radio transmits the message.  This is the easiest way to deploy the fox legally.  To utilize GPIO 4 and use the Pi by itself as a transmitter you must set vox to 0 in settings.  In this case no handheld radio is required, you simply add a wire to pin 7 on your Pi and feed into a low pass or bandpass filter for the chosen frequency and from there to an antenna.

See http://www.homingin.com/boxes.html for an easy to build low pass filter on the 2m band.

pifox can be ran in several modes both assisted requiring a connection to the pi to run the script and unassisted.  When in unassisted mode we call it autofox.  When autofox is enabled it bypasses all menus and goes straight into transmitting.  To disable autofox to edit settings or for whatever reason run "sudo ./pifox.sh autofoxoff".  You can set autofox in settings to 1 to automatically run pifox with your configured settings.  With just this setting enabled it still requires you to log into your pi and run the script which may not be convenient in the field.  To solve this problem I added a menu item to setup pifox to run when your pi boots up or is powered on.  Simply select the run at boot menu option to have pifox run when power is connected to the pi.  To stop the transmission when your pi boots up run "sudo ./pifox.sh killfox" and to remove from startup select the menu option remove from boot.  This may still not be ideal and I thought of this instance too and wrote a script to only transmit when a switch is flipped or an on/off button is on.  For this instance you would set foxbutton to 1.  This uses GPIO 23(pin 16) connected to a switch on a pullup resistor to transmit your fox.  Please refer to the included schematic if you need help with this.  My foxbox has a pi powered by a 6000mah usb power bank inside a 30 caliber ammo can and is running pifox and starts automatically when the pi is powered on and waits for a switch to be flipped before it starts transmitting as in the last example.  In my opinion this is the ideal method of deploying the fox in the field. It requires no user input and is easy for anyone to deploy with just the flip of a switch.

-----

Quick Help
-

Help my pifox automatically starts transmitting when pifox is ran and I can not edit settings!
-
Autofox is enabled, to disable autofox run "sudo ./pifox autofoxoff".  You may enable it again by editting settings from the main menu.

Help every time I power on or boot my pi the pifox script starts transmitting!
-
Run "sudo ./pifox.sh killfox" to stop transmitting.
It will still run on next boot.  To remove it from startup run pifox and select menu option remove from boot.  This only happens when you have selected the menu option to automatically run at boot.

----
Menu options
-----
Input a number and press enter to access menu option.

0 Run fox script
-
Starts transmission

1 Load default settings
-
Loads the default settings but asks user to input their callsign and a message.

2 Edit current settings
-
This takes full advantage of any setting the user wishes giving full control of the fox.

3 Display current settings
-
Displays current configuration file for easy reference.

4 Automatically run at boot
-
Enables autofox and runs pifox when you power on your pi.  This is the best option for deploying a fox in the field.

5 Remove from boot
-
Removes pifox from startup

6 Close program
-
Exit script

-----
Settings
-----
For many settings 0 is OFF / 1 is ON

Do not leave any line blank you must manually input all settings.  Input the setting then press enter to proceed to the next setting.

Callsign:
-
Input your ham callsign.  This is required by the FCC and is found on your ham ticket.  You know what this is. *

Message:
-
Message to transmit.  Message format is "callsign message at time" If foxtime is enabled else it is just "callsign message here".  The message may contain spaces. *

*note: If using packet radio callsign and message must be all UPPERCASE.

Foxtime:
- 
Transmits the current time at the end of the message as in example above.  On is 1 and off is 0.
Default is 1

Autofox:
-
Bypasses menus and transmits automatically with current settings when script is ran.  This is useful for deploying in the field where connecting to Pi  may not be convenient.  You must still manually run the script but the script requires no user input and automatically loads your settings.  To disable autofox run "sudo ./pifox.sh autofoxoff".  For a completely automated fox select the menu option run at boot so pifox transmits when pi is powered on requiring 0 user input.  This is the best option for field use.
Default is 0

Foxbutton:
-
Turn transmission on and off via a pull-up resistor on an on/off button or a switch via GPIO23 aka pin 16.  This is useful for testing or when autofox is enabled and pifox runs at boot.  Refer to included schematic if needed.
Default is 0

Vox:
-
Uses audio out on Pi to trigger vox on a handheld radio instead of using GPIO 4 pin 7 as antenna.  Set this to 0 to use Pi GPIO 4 pin 7 and a piece of wire as transmitter ran through a low pass filter.  When vox is set to 0 no radio is needed the pi is the radio transmitter.  For testing and legal reasons
Default is 1

Voice:
-
Transmits your callsign and message in voice mode using festival text to speech package.
Default is 1

Packet:
-
Transmits in packet radio mode.  Callsign and Message must be all uppercase for this to function.
Default is 0

Frequency:
-
Frequency to transmit on.
Default is 146.565

Interval:
-
This is the duration between transmissions in seconds.
Default is 60

Plays:
-
Number of times to transmit the fox. 0 equals infinite.  This is useful for testing or if you want your fox to stop transmitting after so long you may multiply interval by plays and get a rough fox hunt time estimate.
Default is 0

ppM:
-
Set the ppM correction of your own device.
Default is -21

Deviation:
-
Set the deviation.
Default is 5.

Preemphasis:
-
Set the preemphasis in microseconds.
Default is 400

Tone:
-
Enable PL Tone.
Default is 0

Tone Frequency:
-
Set the tone frequency in Hz.
Default is 110.9

Power:
-
Set the transmit power level as 0-7.
Default is 7

-----

Thank you.  Please let me know how the script works for you. I would enjoy hearing that your club is using pifox.  If making changes or redistributing pifox please be sure to give me credit.  Report any bugs or feedback to km4efp@yahoo.com 

An up to date version can be found at
https://github.com/km4efp/pifox
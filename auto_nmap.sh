#!/bin/bash
# Automated nmap scans
# Dustin
# 12/16/2015

# User prompt, select scan
echo "What kind of scan would you like to run?"
echo "Ping=1, TCP=2, UDP=3, Stealth=4, OS=5, Other=6"
echo -n "Please enter a number and press enter: "
read scanNumber

# Other variables
DATE=date +%F
OUTFILEDIR=~/Desktop/Scans
FILENAME=$scanType-$DATE

if [ scanNumber == 1 ]
then
	scanType=pingScan
	echo -n "Please enter the network you would like to scan in the format network/submask: "
	read NETWORK
	pingScan()
elif [ scanNumber == 2 ]
then
	scanType=tcpScan
	echo -n "Please enter the network you would like to scan in the format network/submask: "
	read NETWORK
	tcpScan()
elif [ scanNumber == 3 ]
then
	scanType=udpScan
	echo -n "Please enter the network you would like to scan in the format network/submask: "
	read NETWORK
	udpScan()
elif [ scanNumber == 4 ]
then
	scanType=stealthScan
	echo -n "Please enter the network you would like to scan in the format network/submask: "
	read NETWORK
	stealthScan()
elif [ scanNumber == 5 ]
then
	scanType=osScan
	echo -n "Please enter the IP address you would like to scan: "
	read TARGET
	osScan()
else
	echo "Script still in progress, please run scan manaully."
fi

###Scan Functions###

# Ping Scan
pingScan()
{
nmap -PE $NETWORK >> $OUTFILEDIR/$FILENAME
}

# TCP Scan
tcpScan() 
{
nmap -sT $NETWORK >> $OUTFILEDIR/$FILENAME 
}

# UDP Scan
udpScan() 
{
nmap -sU $NETWORK >> $OUTFILEDIR/$FILENAME 
}

# Stealth scan
stealthScan()
{
nmap -sS $NETWORK >> $OUTFILEDIR/$FILENAME
}

# Operating System
osScan()
{
nmap -O $TARGET >> $OUTFILEDIR/$FILENAME
}

# Christmas Scan (Not good for Windows hosts)
xmasScan()
{
nmap -sX $target >> $OUTFILEDIR/$FILENAME
}

# Fin Scan (Not good for Windows hosts)

# Null Scan (Not good for Windows hosts)

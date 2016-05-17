#!/bin/bash


#  If smoke parameter is passed in to run ONLY smoke tests
if [ "`echo $1 | tr [:upper:] [:lower:]`" = "smoke" ]; then
	echo Matched Smoke
	Smoke='-i smoke'
fi


# Change to the directory where testsuites are stored
cd $HOME/trunk/Trellis


# Verify that output and downloads directories exist, create if they don't, clean out if they do
if [ ! -d $HOME/junk/RegressionTests_Trellise ]; then
	mkdir -p $HOME/junk/RegressionTests_Trellis
else
	rm -rf $HOME/junk/RegressionTests_Trellis/*
fi


##  Checkout the code for a specific branch based on environment running in
cd $HOME/trunk/Trellis
git checkout master
git pull


#  Verify that vars file is available
if [ ! -r $HOME/trunk/TrellisTestVars.txt ]; then
	echo "**********************************************"
	echo "* * *  Missing TrellisTestVars.txt file  * * *"
	exit
fi


#  Run the cleanup and regression suites
cd $HOME/trunk/Trellis
pybot -A ../TrellisVars.txt --name API $Smoke -d $HOME/junk/RegressionTests_Trellis/ -o API-Output.xml -A Trellis_API_Tests.list
pybot -A ../TrellisVars.txt --name FireFox $Smoke -d $HOME/junk/RegressionTests_Trellis/ --variable SShotBase:FireFox --variable Browser:ff -o FireFox-Output.xml -A Trellis_GUI_Tests.list
pybot -A ../TrellisVars.txt --name Chrome $Smoke -d $HOME/junk/RegressionTests_Trellis/ --variable SShotBase:Chrome --variable Browser:chrome -o Chrome-Output.xml -A Trellis_GUI_Tests.list


#  Check for all the xml files to be present
if [ ! -r $HOME/junk/RegressionTests_Trellis/Cleanup-Output.xml ]; then
	echo "- - -  Missing Cleanup-Output.xml file"
fi
if [ ! -r $HOME/junk/RegressionTests_Trellis/API-Output.xml ]; then
	echo "- - -  Missing API-Output.xml file"
fi
if [ ! -r $HOME/junk/RegressionTests_Trellis/FireFox-Output.xml ]; then
	echo "- - -  Missing FireFox-Output.xml file"
fi
if [ ! -r $HOME/junk/RegressionTests_Trellis/Chrome-Output.xml ]; then
	echo "- - -  Missing Chrome-Output.xml file"
fi
# Now combine all the results into one report
cd $HOME/junk/RegressionTests_Trellis
if [ -r $HOME/junk/RegressionTests_Trellis/API-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_Trellis/FireFox-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_Trellis/Chrome-Output.xml ] ; then
	echo "--------------------------------------------------------------------------"
	echo "- - -   Combining output.xml files from Cleanup and Regression run"
	echo "--------------------------------------------------------------------------"
	rebot --name Trellis_Regression -n USERMAN-* -n QA-* \
		$HOME/junk/RegressionTests_Trellis/API-Output.xml \
		$HOME/junk/RegressionTests_Trellis/FireFox-Output.xml \
		$HOME/junk/RegressionTests_Trellis/Chrome-Output.xml
else
	echo "************************************************************"
	echo "* * *   output.xml file missing, no report generated   * * *"
	echo "************************************************************"
fi

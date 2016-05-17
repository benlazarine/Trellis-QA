#!/bin/bash


DateDir=$(date +%F | sed s/-//g)


cd $HOME/trunk/Trellis


sftp -oPort=1657 -b - qa-4.iplantcollaborative.org <<END
-mkdir incoming
-mkdir incoming/$DateDir
-cd incoming/$DateDir
-put $HOME/junk/RegressionTests_Trellis/*.html
-put $HOME/junk/RegressionTests_Trellis/*.xml
-put $HOME/junk/RegressionTests_Trellis/*.png
END


echo "Files should now be uploaded to QA-4"

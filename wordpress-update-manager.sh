#!/bin/bash

#(｡◕‿◕｡)

# ======================
# = Wordpress and plugins Update Script with wp-cli
# ======================
#bash path/to/the/script/update-wp-site-script.sh 

# colorize and formatting command line
# You need iTerm and activate 256 color mode in order to work 
green='\x1B[0;32m'
cyan='\x1B[1;36m'
blue='\x1B[0;34m'
grey='\x1B[1;30m'
red='\x1B[0;31m'
bold='\033[1m'
normal='\033[0m'

# Jump a line
function line {
  echo " "
}

# Your assistance bot 
function bot {
  line
  echo -e "${blue}${bold}(｡◕‿◕｡)${normal}"
}

# admin email - to complete
email=""

# path to the file where all the website urls are
urlfilepath="/path/to/the/Url-list.txt"

#Check wp-cli version 
bot
echo -e "Check wp cli version" 
wp cli version

bot
echo -e "Check wp-cli update and update if necessary" 
wp cli check-update
wp cli update

#help wp cli
#wp --porcelain 

#deactive plugins (except security and major ones) before update - Customise the line depending on plugins installed
bot
echo -e "Deactive plugins before update (there will be activate before the end of the script)" 
wp plugin --deactivate
# example :
# wp zotpress --deactivate


#Verifies file integrity by comparing to published checksums.
bot
echo -e "Verifies file integrity by comparing to published checksums." 
wp core verify-checksums

#save bdd defore update
#Be sure never to store your MySQL backup in
#any folder below public_html (or your server’s docroot) as 
#technically it could be downloaded that way.
bot
echo -e "Export database for save" 
wp db export


#Verifies wordpress version for update
bot
echo -e "Checke wordpress packages and Verifies wordpress version" 
wp package update 
wp core version --extra

bot
echo -e "Verifies if there is a wordpress update"
wp core check-update 

#mise à jour wordpress
###Parcours le fichier txt listeUrl.txt ou sont listés les sites web et met à jour les core
bot
echo -e "Update wordpress version for each wordpress website on the Url-list.txt"
while read line || [ -n "$line" ]
do
	echo Upgrading $line...
    wp --path=$line db export 
    wp --path=$line core update
#    wp --path=$line plugin update --all
#    wp --path=$line theme update --all
done < $urlfilepath

#If you see "Error: Another update is currently in progress."
#you may need to run 
#wp option delete core_updater.lock 

bot
echo -e "Plugins Reactivation"
# Plugins reactivation
wp plugin --activate
wp plugin status

bot
echo -e "Search for plugins update and update if there is"
wp plugin update --all --dry-run
wp plugins status

bot
echo -e "Search for template update and update if there is"
#template update
wp theme update --all

bot
echo -e "Update database"
#update database procedure
wp core update-db --network
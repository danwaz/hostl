#!/bin/bash
#Update hosts file and vhosts file with one command
#run `hostme` in the root of your project directory
#that's it!

#edit the location of your hosts file and vhost.conf
VHOSTS_FILE=/etc/apache2/extra/httpd-vhosts.conf
HOSTS_FILE=/etc/hosts

#run hostme open to also open files in your editor of choice
OPEN_INPUT=$1
OPEN_KEY="open"
TEXT_EDITOR_ALIAS=subl

#modify your project url
#default - local.working-directory-name.com
URL_PREFIX=local.
CURRENT_DIR=${PWD##*/}
URL_SUFFIX=.com
URL=$URL_PREFIX$CURRENT_DIR$URL_SUFFIX

#append to vhosts file
printf "\n<VirtualHost *:80>\n" >> $VHOSTS_FILE
printf "\tDocumentRoot \"`pwd`\"\n" >> $VHOSTS_FILE
printf "\tServerName $URL\n" >> $VHOSTS_FILE
printf "\tServerAlias $URL\n" >> $VHOSTS_FILE
printf "\tErrorLog \"/private/var/log/apache2/`pwd`-error_log\"\n" >> $VHOSTS_FILE
printf "</VirtualHost>\n" >> $VHOSTS_FILE
printf "\n" >> $VHOSTS_FILE

#append to hosts
printf "127.0.0.1 $URL\n" >> $HOSTS_FILE

#restart apache
`sudo apachectl restart`
echo "Apache restarted"

#open both files for further editting
if [ "$OPEN_INPUT" = "$OPEN_KEY" ] ;
	then
	`$TEXT_EDITOR_ALIAS $VHOSTS_FILE`
	`$TEXT_EDITOR_ALIAS $HOSTS_FILE`
fi

echo "Hosts updated!"

#open in browser
BROWSER_PATH="/Applications/Google Chrome.app/"
`open -a "$BROWSER_PATH" http://$URL`
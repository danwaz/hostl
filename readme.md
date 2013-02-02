#Hostl
Update hosts and vhosts files with one command

Setup
-----

Clone the project and create a new alias in `.bash_profile`
	alias hostl='sudo /path/to/hostl.sh'

Within `hostl.sh` 
* edit $HOSTS_FILE and $VHOSTS_FILE to each respective file path
* edit $TEXT_EDITOR_ALIAS with your text editor of choice
* edit $BROWSER_PATH with your browser path

Usage
-----

run `hostl` in your project's root directory
run `hostl open` to open $HOSTS_FILE and $VHOSTS_FILE in a text editor

**Note:** This script needs to be run with root level permissions since we are modify root level files. 
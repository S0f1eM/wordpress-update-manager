# WordPress Update Assistant Manager with wp-cli

Script for updating all the WordPress Websites hosted with one command and wp-cli tools.

## Installation

Just downloading the file zip on your computer wherever you want. For example, at the root folder of your wordpress websites.

## Prerequisites 

You will need having wp-cli on your computer for using this script. 
For the wp-cli installation and prerequisites follow this link https://wp-cli.org/#installation

* UNIX-like environment (OS X, Linux, FreeBSD, Cygwin); limited support in Windows environment
* PHP 5.4 or later
* ordPress 3.7 or later. Versions older than the latest WordPress release may have degraded functionality

## Usage

Don't forget to change and replace all the variables and default path on the file before running the following command.

```bash
bash path/to/the/script/file/wordpress-update-manager.sh 
```

## Script workflow

The script will make the following actions : 
	
* Check the wp-cli version
* Update wp-cli if necessary
* Desactivate plugins you list on the file .txt you choose to call
* Verifies file integrity by comparing to published checksums
* Export database for save (see db export in wp-cli documentation for more details about where you want to save it)
* Verifies the wordpress updates
* Update wordpress version for each websites on your personnal list.txt
* Activate plugins 
* Search for plugins updates and updating if some found
* Search for template update and update if some found
* Update core database

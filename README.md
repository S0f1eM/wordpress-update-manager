


# WordPress Update (｡◕‿◕｡) Assistant Manager   


### Table Of Contents
* [Introduction](#intro)
* [System requirements](#prerequisites)
* [Installation](#setup)
* [Usage](#usage)
* [Features](#features)
* [Links](#links)

## Introduction<a name="intro"></a>

This script was made for updating several WordPress websites hosted on internal servers.
I used Bash and wp-cli tools.

## System requirements<a name="prerequisites"></a>

You need wp-cli on your computer for using this script. 
For the wp-cli installation and prerequisites follow this link https://wp-cli.org/#installation

* UNIX-like environment (OS X, Linux, FreeBSD, Cygwin); limited support in Windows environment
* PHP 5.4 or later
* WordPress 3.7 or later. Versions older than the latest WordPress release may have degraded functionality.


## Installation<a name="setup"></a>

Just downloading the file zip on your computer wherever you want. 
The script must be at the root folder of your wordpress websites.

## Usage<a name="usage"></a>

Go to the directory where are your WordPress websites folder in which you want to use the script. 
You will need also 2 .txt files : 
* 1 for listing websites path you want to update.
* 1 .txt for the major plugins names you want to desactivate before at the beginning of the process, before the update. They will be reactivate at the end.

Before running the script with the following command you need to change and replace all the variables and default path in the file according to your needs.  

```bash
bash path/to/the/script/file/wordpress-update-manager.sh 
```

## Features<a name="features"></a>

The script will make the following actions : 
	
* Check the wp-cli version.
* Update wp-cli if necessary.
* Desactivate plugins you list on the file .txt you choose to parse in the script.
* Verifies file integrity by comparing to published checksums.
* Export database for save (see db export in wp-cli documentation for more details about where you want to save it).
* Verifies the wordpress updates.
* Update wordpress version for each url websites on your list.txt.
* Reactivate plugins.
* Search for plugins updates and updating if found. (this part can also be set in comments for security choices).
* Search for template update and update if found.
* Update the core database.

## Links<a name="links"></a>

* *[WP-CLI](https://wp-cli.org/fr/)*


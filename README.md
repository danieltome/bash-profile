# bash-profile
My personal bash profile for Mac OSX

I've forked this initial setup from: https://github.com/fauzanariffin/bash-profile


## This file holds some neat BASH configurations and aliases

It is divided into 8 sections.

### Environment Configuration

Paths and Prompt setup

### Make Terminal Better (remapping defaults and adding functionality)

Aliases. Eg: preferred ls, also cd.. .3 to do cd.. 3 times, etc.
Recursive dir listing, also integrating Sublime and Finder with some commands.

### File and Folder Management

File counting, dummy file generation and unzipping made easy

### Searching

qfind to quickly search for file. "Who remembers the syntax for find . -name?"
also use spotlight from command line.

###  Process Management

Find which processes are hogging up memory and cpu.

###  Networking

Several useful aliases.

###  System Operations & Information

Toggling finder's hidden files, cleaning up DS_Store files

### Web Development

Apache and the usuals.


# How to use this?

* Just edit the PATHS with what you require.
* Then copy the bash_profile file in your home directory as .bash_profile

```
cp bash_profile ~/.bash_profile
```

If you already have a terminal open run this: 

```
source ~/.bash_profile
```


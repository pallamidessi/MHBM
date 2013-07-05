MHBM
====

Multiple History Buffer Manager

Simple script which aims to offer a sane history buffer switching mechanism.
Buffer are shared between terminal, and kept between session.
The current buffer in use is showed next to the prompt.
A ncurse gui to manage the content of buffer.

INSTALL
===

sudo sh install.sh

Only newly created terminal will have the change at this point (or you can source your .bashrc to enable
mhbm in your cirrent one)

USAGE
===

mhbm BUFFERNAME 

Create a buffer named BUFFERNAME. If BUFFERNAME exists its history
content will be read.

mhbm -d BUFFERNAME

Delete BUFFERNAME if it exists. Terminal using this buffer will no longer write their
history, and every new command will be lost.

mhbm default

The history file specified by $HISTFILE (default history file) will be use. Restore the
$PS1

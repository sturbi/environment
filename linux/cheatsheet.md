# cheatsheet
## bash
```
strg+a				: start of line
strg+e				: End fo line
strg+l				: clear Screen
strg+b				: previous word begin
strg+f 				: next word end
strg+u				: delete to start of line
strg+k				: delete to end of line
alt+u				: Uppercase to end of word
alt+l				: lowercase to end of word
```
## tmux
```
strg+a "			: horizontal teilen
strg+a  %  		    : vertikal teilen
```
## vim
```
i					: insert before the cursor
I					: insert at the beginning of the line
a					: insert (append) after the cursor
A					: insert (append) at the end of the line
o					: append (open) a new line below the current line
O					: append (open) a new line above the current line

u 					: undo
yy					: copy line
2yy					: copy 2 lines
p					: paste after
P					: paste before
d					: delete line
d2					: delete 2 lines
d					: delete to the end
<					: shift left
>					: shift right
~					: toggle case
3~					: toggle 3 chars
g~~					: toggle line
g~$					: toggle to end of line

:%s/old/new/g		: replace
:%s/old/new/gc	    : replace with confirm

:set tabstop=8	    : tabstops
:set syntax=php     : php syntax
:set syntax on	    : syntax on
:set paste			: paste mode
:set nopaste		: no pastemode

:tabe file			: open file
:tabn				: next tab
:tabp				: priv tab

strg+ww				: switch buffer
```
## ssh key generation
```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "sturbi@sturbi.de"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
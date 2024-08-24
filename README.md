
![alt text](http://www.empede.co.uk/imgrepos/Cralias.png "cralias")


Cralias - a set of useful aliases for bash
==========================================

**Cralias** is a set of useful commands and shortcuts for the terminal!

For example, who wouldn't want to type `..` to go up a directory, or `...`, to go up two directories? How about `vk` to view a live list of all files in the current directory? Or `unik` to deduplicate entries in an output stream without sorting.

The full list of all commands is in `cralias.sh`, each one is commented describing what it does!

If you have any suggestions for cralias commands, let me know!


Installation
===============

Add `source </path/to/cralias>/cralias.sh` to your `bashrc` to use cralias!

Or, more explicitly:

Clone the thing:
```
mkdir -p ~/Software; cd ~/Software
git clone git@github.com:mpdunne/cralias.git
```

And then for Linux:

```
echo "source ~/Software/cralias/cralias.sh" >> ~/.bashrc
source ~/.bashrc
```

Or for Mac:

```
echo "source ~/Software/cralias/cralias.sh" >> ~/.zshrc
source ~/.zshrc
```

For Windows? No idea 🤷🏻‍♂️.

Requirements
============

Cralias uses standard bash and zsh functions. Some systems may be not have all required functions built in, but you can install them! For full functionality:
- Make sure `watch` is installed (e.g. `brew install watch` on Mac)
- Make sure `column` is installed (e.g. on linux might need to do `apt install util-linux` and/or `apt install bsdmainutils`).
- If using zsh or a Mac, install `gfind` using `brew install findutils`.


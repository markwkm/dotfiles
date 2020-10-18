==========
 dotfiles
==========

Software
========

* Backup: `restic <https://restic.github.io/>`_ - A backup program that is
  fast, efficient and secure
* File manager: `spacefm <https://ignorantguru.github.com/spacefm/>`_ - A
  multi-panel tabbed file manager
* Image viewer:
  * `feh <https://feh.finalrewind.org/>`_ - A small and easy to use folding
    editor
  * `geeqie <http://www.geeqie.org>`_ - A lightweight GTK image viewer
* Mail User Agent: `mutt <http://www.mutt.org/>`_ - A small but very powerful
  text-based mail client
* PDF presenter: `pdfpc <https://pdfpc.github.io>`_ - Presenter console with
  multi-monitor support for PDF files
* PDF viewer: `evince <https://wiki.gnome.org/Apps/Evince>`_ - Simple document
  viewer for GNOME
* Shell: `Dash <http://gondor.apana.org.au/~herbert/dash/>`_ - POSIX-compliant Unix shell
* Shell: `tcsh <http://www.tcsh.org/>`_ - Enhanced but compatible version of the Berkeley C shell
* Shell: `zsh <https://www.zsh.org/>`_ - UNIX Shell similar to the Korn shell
* Terminal: `st <https://st.suckless.org/>`_ - simple terminal implementation for X
* Text editor: `vim <https://github.com/vim/vim>`_ - an improved vi-style text editor
* Window manager: `i3 <https://i3wm.org/>`_ - An improved dynamic tiling window manager

Fonts
=====

* Regenerate font cache: `fc-cache -f -v`
* `Droid <http://www.cosmix.org/software/>`_ - for anything HiDPI.  Slashed or
  dotted preferred.
* `M+ <http://mplus-fonts.sourceforge.jp/>`_ - specifically 1m for terminals or
  non-HiDPI

i3
==

* Use `nitrogen <http://projects.l3ib.org/nitrogen/>`_ to set background image.
* Use `rofi <https://davedavenport.github.io/rofi/>`_ with dmenu.
* Use `compton <https://github.com/chjj/compton>`_ for X compositor.
* Use `transset <http://cgit.freedesktop.org/xorg/app/transset/>`_ to set
  transparency manually.

Mutt
====

* Use `daemonize <https://bmc.github.com/daemonize/>`_ to run custom scripts as
  daemons.
* Use `mbsync <http://isync.sourceforge.net/>`_ to sync a remote IMAP server to
  a local Maildir directory.
* Use `monit <http://mmonit.com/monit/>`_ to manage custom daemons to retrieve
  mail and make notifications of new mail.
* Use `mu <http://www.djcbsoftware.nl/code/mu/>`_ to search Maildirs.
* Use `mutt-solarized-github
  <https://github.com/altercation/mutt-colors-solarized>`_ - color scheme.

terminal utilities
==================

* `clusterssh <https://github.com/duncs/clusterssh>`_ - Concurrent Multi-Server
  Terminal Access
* `tmux <https://tmux.github.io/>`_ - Terminal multiplexer

vim
===

* Use `Vundle <https://github.com/gmarik/Vundle.vim.git>`_ for managing
  plugins.

Plugins
-------

* 'altercation/vim-colors-solarized' - Color scheme
* 'scrooloose/nerdtree' - File system explorer
* 'tpope/vim-fugitive' - Git integration
* 'vim-airline/vim-airline' - status line
* 'vim-airline/vim-airline-themes'
* 'ludovicchabant/vim-gutentags' - Automatic ctag management
* 'majutsushi/tagbar' - Side bar to tags in current file
* 'mhinz/vim-signify' - Show changed lines if VCS is in use
* 'scrooloose/syntastic' - Syntax highlightning
* 'jphustman/SQLUtilities' - SQL formatting
* 'JuliaEditorSupport/julia-vim' - Julia language highlightning

lxd
===

* lxc image list images:
* lxc launch <image> <container name>
* lxc config set CONTAINER security.privileged true
* lxc config device add CONTAINER homedir disk source=/home path=/home
* lxc config device add CONTAINER testdir disk source=/mnt/test path=/mnt/test
* lxc config set <container> raw.lxc 'lxc.mount.auto = cgroup'
* lxc config device add CONTAINER eth0 nic nictype=bridged parent=virbr0 name=eth0
* lxc config device add CONTAINER eth1 nic nictype=bridged parent=virbr1 name=eth1

urxvt
=====

* printf '\e]710;%s\007' "xft:M+ 1mn:medium:size=9"

tmux
====

* tmux set status on
* tmux source-file ~/.tmux.conf
* balance pants
  * horizontal: C-b M-1
  * vertical: C-b M-2
* split
  * vertical C-%
  * horizontal C-"

setxkbmap
=========

::

  setxkbmap -layout us -variant altgr-intl -option caps:backspace

xmodmap
=======

::

  clear lock
  xmodmap -e "keycode 22 = Escape"

HiDPI
=====

.Xresources

::

  Xft.dpi: 192
  Xcursor.size: 32

~/.config/gtk-3.0/settings.ini

.xprofile

::

  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5

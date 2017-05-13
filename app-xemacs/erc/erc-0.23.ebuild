# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SLOT="0"
DESCRIPTION="ERC - The Emacs IRC Client"
XEMACS_PKG_CAT="standard"

KEYWORDS="alpha amd64 ppc64 x86"

inherit xemacs-packages

RDEPEND="app-xemacs/edit-utils
app-xemacs/fsf-compat
app-xemacs/gnus
app-xemacs/pcomplete
app-xemacs/xemacs-base
app-xemacs/text-modes
app-xemacs/xemacs-ispell
app-xemacs/viper
"

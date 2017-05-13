# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SLOT="0"
DESCRIPTION="MULE: Lisp Interface to EDICT, Kanji Dictionary"
XEMACS_PKG_CAT="mule"

RDEPEND="app-xemacs/mule-base
app-xemacs/xemacs-base
"
KEYWORDS="alpha amd64 ppc64 x86"

inherit xemacs-packages

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SLOT="0"
DESCRIPTION="Provides a separate frame with convenient references"
XEMACS_PKG_CAT="standard"

RDEPEND="app-xemacs/xemacs-base
app-xemacs/edebug
"
KEYWORDS="alpha amd64 ppc64 x86"

inherit xemacs-packages

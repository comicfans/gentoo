# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=RMCFARLA
MODULE_VERSION=0.50
MODULE_SECTION=Gtk2-Perl-Ex
inherit perl-module

DESCRIPTION="A simple interface to Gtk2's complex MVC list widget"

LICENSE="|| ( LGPL-2.1 LGPL-3 )" # LGPL-2.1+
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=dev-perl/Gtk2-1.60.0
	>=dev-perl/glib-perl-1.62.0
"
DEPEND="${RDEPEND}"

# needs X
SRC_TEST="no"

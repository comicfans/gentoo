# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=JOSHUA
MODULE_VERSION=1.10
inherit perl-module

DESCRIPTION="Automate telnet sessions w/ routers&switches"

SLOT="0"
KEYWORDS="alpha amd64 hppa ~mips ppc64 x86"
IUSE=""

RDEPEND="dev-perl/Net-Telnet
	dev-perl/TermReadKey"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/1.10-warning.patch" )

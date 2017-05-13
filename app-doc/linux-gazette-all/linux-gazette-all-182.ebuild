# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Linux Gazette - all issues"
HOMEPAGE="http://linuxgazette.net/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa m68k ~mips ppc64 s390 sh x86"
IUSE=""

RDEPEND=$(eval echo =app-doc/linux-gazette-{0{1,9},{10..${PV}}})

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
XORG_STATIC=no
inherit xorg-2

DESCRIPTION="create dependencies in makefiles"
KEYWORDS="alpha amd64 arm arm64 hppa ~mips ppc64 s390 sh x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-proto/xproto"

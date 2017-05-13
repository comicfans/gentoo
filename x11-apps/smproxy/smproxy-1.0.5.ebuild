# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit xorg-2

DESCRIPTION="Session Manager Proxy"

KEYWORDS="alpha amd64 arm hppa ~mips ppc64 s390 sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libXt
	x11-libs/libXmu"
DEPEND="${RDEPEND}"

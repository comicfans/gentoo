# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit xorg-2

DESCRIPTION="point and click selection of X11 font names"

KEYWORDS="alpha amd64 arm hppa ~mips ppc64 ~s390 ~sh x86 ~ppc-aix ~amd64-linux ~x86-linux ~x64-macos"
IUSE=""

RDEPEND="x11-libs/libXaw
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libX11"
DEPEND="${RDEPEND}"

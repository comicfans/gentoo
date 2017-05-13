# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit xorg-2

DESCRIPTION="round X clock"

KEYWORDS="alpha amd64 arm ~mips ppc64 s390 sh x86 ~amd64-linux ~x86-linux"
IUSE=""
RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libxkbfile"
DEPEND="${RDEPEND}"

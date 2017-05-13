# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit xorg-2

DESCRIPTION="Utility to set XInput device parameters"

KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 ~sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-libs/libX11-1.3
	x11-libs/libXext
	>=x11-libs/libXi-1.5.99.1
	x11-libs/libXinerama
	x11-libs/libXrandr"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-2.1.99.1"

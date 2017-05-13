# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org JIS (japanese) fonts"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 s390 sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}
	x11-apps/bdftopcf
	>=media-fonts/font-util-1.1.1-r1"

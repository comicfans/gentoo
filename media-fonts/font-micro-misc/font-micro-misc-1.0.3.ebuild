# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org micro-misc font"
LICENSE="public-domain"

KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 s390 sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-apps/bdftopcf"

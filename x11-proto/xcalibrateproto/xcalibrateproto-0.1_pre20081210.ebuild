# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

MY_P="${PN/x/}-${PV#*_pre}"
XORG_EAUTORECONF="yes"
inherit xorg-2

DESCRIPTION="Touchscreen calibration protocol"
SRC_URI="mirror://gentoo/${MY_P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="alpha amd64 arm hppa m68k ~mips ppc64 s390 sh x86 ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

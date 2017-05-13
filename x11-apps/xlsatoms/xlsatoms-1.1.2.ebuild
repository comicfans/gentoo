# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit xorg-2

DESCRIPTION="list interned atoms defined on server"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 ~s390 ~sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libxcb"
DEPEND="${RDEPEND}"

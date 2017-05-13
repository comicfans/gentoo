# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils autotools

DESCRIPTION="displays info about resources used by a program"
HOMEPAGE="https://www.gnu.org/directory/time.html"
SRC_URI="mirror://gnu/time/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~s390 ~sh ~x86 ~amd64-linux ~x86-linux"
IUSE=""

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-build.patch \
		"${FILESDIR}"/${PV}-info-dir-entry.patch \
		"${FILESDIR}"/${P}-incorrect_memory_usage.patch
	eautoreconf
}

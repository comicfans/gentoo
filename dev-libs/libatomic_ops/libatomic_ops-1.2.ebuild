# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Implementation for atomic memory update operations"
HOMEPAGE="http://www.hpl.hp.com/research/linux/atomic_ops/"
SRC_URI="http://www.hpl.hp.com/research/linux/atomic_ops/download/${P}.tar.gz"

LICENSE="MIT boehm-gc GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc64 ~sh ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack(){
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-ppc64-load_acquire.patch
}

src_install() {
	emake pkgdatadir="/usr/share/doc/${PF}" DESTDIR="${D}" install || die
}

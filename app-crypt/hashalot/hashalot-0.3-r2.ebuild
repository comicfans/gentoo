# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="CryptoAPI utils"
HOMEPAGE="http://www.kerneli.org/"
SRC_URI="http://www.paranoiacs.org/~sluskyb/hacks/hashalot/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa m68k ~mips ppc64 s390 sh x86"
IUSE=""

DEPEND=""

src_test() {
	make check-TESTS || die
}

src_install() {
	make DESTDIR="${D}" install || die "install error"
	dodoc ChangeLog NEWS README
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils toolchain-funcs

DESCRIPTION="control magnetic tape drive operation"
HOMEPAGE="https://github.com/iustin/mt-st"
SRC_URI="${HOMEPAGE}/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa ~mips ppc64 x86"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS} ${LDFLAGS}"
}

src_install() {
	dosbin mt stinit
	doman mt.1 stinit.8
	dodoc README* stinit.def.examples
}

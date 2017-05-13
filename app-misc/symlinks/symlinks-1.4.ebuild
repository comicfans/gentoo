# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit flag-o-matic eutils toolchain-funcs

DESCRIPTION="Scans for and fixes broken or messy symlinks"
HOMEPAGE="http://www.ibiblio.org/pub/linux/utils/file/"
SRC_URI="http://www.ibiblio.org/pub/linux/utils/file/${P}.tar.gz"

LICENSE="symlinks"
SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ppc64 x86"
IUSE="static"

src_compile() {
	# could be useful if being used to repair
	# symlinks that are preventing shared libraries from
	# functioning.
	use static && append-flags -static
	emake CC=$(tc-getCC) CFLAGS="${CFLAGS} ${LDFLAGS}" || die
}

src_install() {
	dobin symlinks || die
	doman symlinks.8 || die
	dodoc symlinks.lsm || die
}

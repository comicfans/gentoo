# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit flag-o-matic eutils libtool

DESCRIPTION="A thesaurus lib, tool and database"
HOMEPAGE="https://sourceforge.net/projects/aiksaurus"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ~mips ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos"
IUSE="gtk"

RDEPEND="gtk? ( x11-libs/gtk+:2 )"
DEPEND="${RDEPEND}
	gtk? ( virtual/pkgconfig )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc43.patch #214248

	# Needed to make relink work on FreeBSD, without it won't install.
	# Also needed for a sane .so versionning there.
	elibtoolize
}

src_configure() {
	filter-flags -fno-exceptions
	econf $(use_with gtk)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS README* ChangeLog
}

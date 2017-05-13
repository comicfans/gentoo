# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="A redirector for Squid"
HOMEPAGE="http://squirm.foote.com.au"
SRC_URI="http://squirm.foote.com.au/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

RDEPEND="net-proxy/squid"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-gentoo.patch
	"${FILESDIR}"/${P}-gcc5.patch
)

src_compile() {
	emake CC="$(tc-getCC)" LDOPTS="${LDFLAGS}"
}

src_install() {
	emake PREFIX="${ED%/}/opt/squirm" install
}

pkg_postinst() {
	einfo "To enable squirm, add the following lines to /etc/squid/squid.conf:"
	einfo "    url_rewrite_program /opt/squirm/bin/squirm"
	einfo "    url_rewrite_children 10"
}

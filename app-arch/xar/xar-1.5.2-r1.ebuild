# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit autotools base eutils

DESCRIPTION="An easily extensible archive format"
HOMEPAGE="https://github.com/mackyle/xar"
SRC_URI="https://github.com/mackyle/${PN}/archive/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa ~ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="acl +bzip2"

DEPEND="dev-libs/openssl
	dev-libs/libxml2
	sys-libs/zlib
	acl? ( sys-apps/acl )
	bzip2? ( app-arch/bzip2 )"
RDEPEND="${DEPEND}"

DOCS=( TODO )
PATCHES=( "${FILESDIR}/${P}-automagic_acl_and_bzip2.patch"
	"${FILESDIR}/${P}-respect_ldflags.patch" )

src_prepare() {
	base_src_prepare
	eautoconf
}

src_configure() {
	econf $(use_enable acl) $(use_enable bzip2)
}

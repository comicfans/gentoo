# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A high-level decoding and seeking API for .opus files"
HOMEPAGE="http://www.opus-codec.org/"
SRC_URI="http://downloads.xiph.org/releases/opus/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc64 ~x86"
IUSE="doc fixed-point +float +http libressl static-libs"

RDEPEND="media-libs/libogg
	media-libs/opus
	http? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:= )
	)"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

REQUIRED_USE="^^ ( fixed-point float )"

src_configure() {
	econf \
		--docdir=/usr/share/doc/${PF} \
		$(use_enable doc) \
		$(use_enable fixed-point)\
		$(use_enable float) \
		$(use_enable http) \
		$(use_enable static-libs static)
}

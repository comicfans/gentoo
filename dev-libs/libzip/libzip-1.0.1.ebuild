# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1
inherit autotools-utils

DESCRIPTION="Library for manipulating zip archives"
HOMEPAGE="http://www.nih.at/libzip/"
SRC_URI="http://www.nih.at/libzip/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~mips ppc64 x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="static-libs"

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}
	app-arch/xz-utils
"

DOCS=( AUTHORS NEWS README THANKS )

PATCHES=(
	"${FILESDIR}/${PN}-0.11.2-headers.patch"
)

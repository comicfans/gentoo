# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=yes

inherit autotools-utils

DESCRIPTION="Small collection of functions intended to enhance the GLib testing framework"
HOMEPAGE="https://launchpad.net/gtx"
SRC_URI="https://launchpad.net/gtx/trunk/${PV}/+download/${P}.tar.gz"

SLOT="0"
LICENSE="LGPL-2.1"
KEYWORDS="~alpha amd64 ~arm ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug doc static-libs"

RDEPEND="dev-libs/glib:2"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-docdir.patch
	"${FILESDIR}"/${P}-debug.patch
	"${FILESDIR}"/${P}-glib.h.patch )

src_configure() {
	local myeconfargs=(
		$(use_enable debug)
	)
	autotools-utils_src_configure
}

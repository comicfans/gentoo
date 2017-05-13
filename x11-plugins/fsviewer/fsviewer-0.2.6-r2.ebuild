# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools multilib

MY_P=${PN}-app-${PV}

DESCRIPTION="A file system viewer for Window Maker"
HOMEPAGE="http://www.bayernline.de/~gscholz/linux/fsviewer/"
SRC_URI="http://www.bayernline.de/~gscholz/linux/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls"

RDEPEND=">=x11-wm/windowmaker-0.95.2
	x11-libs/libXft
	x11-libs/libXpm
	x11-libs/libX11"
DEPEND="${RDEPEND}
	x11-proto/xproto
	nls? ( sys-devel/gettext )"

S=${WORKDIR}/${MY_P}

PATCHES=(
	"${FILESDIR}"/${P}-configure.patch
	"${FILESDIR}"/${P}-gcc5.patch
	"${FILESDIR}"/${P}-wmaker-0.95_support.patch
	"${FILESDIR}"/${P}-fix_title_bar.patch
)
DOCS="AUTHORS ChangeLog NEWS README"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable nls) \
		--with-appspath=/usr/$(get_libdir)/GNUstep
}

src_install() {
	default
	dosym /usr/$(get_libdir)/GNUstep/FSViewer.app/FSViewer /usr/bin/FSViewer
}

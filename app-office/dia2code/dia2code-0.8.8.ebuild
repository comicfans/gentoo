# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit gnome2

DESCRIPTION="Convert UML diagrams produced with Dia to various source code flavours"
HOMEPAGE="http://dia2code.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/libxml2"
RDEPEND="${DEPEND}"

src_install() {
	gnome2_src_install
	doman dia2code.1
}

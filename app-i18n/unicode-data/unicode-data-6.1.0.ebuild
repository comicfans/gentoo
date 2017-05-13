# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Unicode data from unicode.org"
HOMEPAGE="http://unicode.org/"
SRC_URI="mirror://debian/pool/main/u/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="unicode"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ppc64 s390 sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	unpack ./*
	rm *.zip
}

src_install() {
	insinto /usr/share/${PN}
	doins -r "${S}"/*
}

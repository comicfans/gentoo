# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Data for the Crystallographic Object-Oriented Toolkit"
HOMEPAGE="https://www2.mrc-lmb.cam.ac.uk/Personal/pemsley/coot/"
SRC_URI="https://www2.mrc-lmb.cam.ac.uk/Personal/pemsley/coot/dependencies/reference-structures.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/coot
	doins -r reference-structures

	# Coot looks in the wrong spot for the monomer library
	# Listens to ccp4's CCP4_LIB rather than CLIBD_MON
	cat >> "${T}"/coot <<- EOF
	COOT_REFMAC_LIB_DIR="${EPREFIX}/usr/share/"
	COOT_REF_STRUCTS="${EPREFIX}/usr/share/coot/reference-structures/"
	EOF

	newenvd "${T}"/coot 20coot
}

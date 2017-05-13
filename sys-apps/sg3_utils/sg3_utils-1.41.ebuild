# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit eutils multilib

DESCRIPTION="Apps for querying the sg SCSI interface"
HOMEPAGE="http://sg.danny.cz/sg/"
SRC_URI="http://sg.danny.cz/sg/p/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~mips ~ppc64 ~s390 ~sh ~x86"
IUSE="static-libs"

DEPEND="sys-devel/libtool"
RDEPEND=""
PDEPEND=">=sys-apps/rescan-scsi-bus-1.24"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.26-stdint.patch
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	dodoc COVERAGE doc/README examples/*.txt
	newdoc scripts/README README.scripts

	# Better fix for bug 231089; some packages look for sgutils2
	local path lib
	path="/usr/$(get_libdir)"
	for lib in "${ED}"${path}/libsgutils2.*; do
		lib=${lib##*/}
		dosym "${lib}" "${path}/${lib/libsgutils2/libsgutils}"
	done

	prune_libtool_files
}

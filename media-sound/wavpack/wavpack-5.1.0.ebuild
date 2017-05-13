# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
AUTOTOOLS_PRUNE_LIBTOOL_FILES=all
AUTOTOOLS_AUTORECONF=yes
inherit autotools-multilib

DESCRIPTION="Hybrid lossless audio compression tools"
HOMEPAGE="http://www.wavpack.com/"
SRC_URI="http://www.wavpack.com/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="static-libs"

RDEPEND=">=virtual/libiconv-0-r1
	abi_x86_32? ( !<=app-emulation/emul-linux-x86-soundlibs-20130224-r4
					!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)] )"
DEPEND="${RDEPEND}"

DOCS=( ChangeLog README )
PATCHES=( "${FILESDIR}/${P}-armv7.patch" )

multilib_src_configure() {
	local myeconfargs=(
		$(multilib_native_enable apps)
	)
	autotools-utils_src_configure
}

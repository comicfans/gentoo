# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
inherit autotools eutils libtool multilib-minimal

DESCRIPTION="Tag Image File Format (TIFF) library"
HOMEPAGE="http://libtiff.maptools.org"
SRC_URI="http://download.osgeo.org/libtiff/${P}.tar.gz
	ftp://ftp.remotesensing.org/pub/libtiff/${P}.tar.gz"

LICENSE="libtiff"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~s390 ~sh ~x86 ~x64-cygwin ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="+cxx jbig jpeg lzma static-libs test zlib"

RDEPEND="jpeg? ( >=virtual/jpeg-0-r2:0=[${MULTILIB_USEDEP}] )
	jbig? ( >=media-libs/jbigkit-2.1:=[${MULTILIB_USEDEP}] )
	lzma? ( >=app-arch/xz-utils-5.0.5-r1:=[${MULTILIB_USEDEP}] )
	zlib? ( >=sys-libs/zlib-1.2.8-r1:=[${MULTILIB_USEDEP}] )
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20130224-r9
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"
DEPEND="${RDEPEND}"

REQUIRED_USE="test? ( jpeg )" #483132

PATCHES=(
	"${FILESDIR}"/${P}-fax2tiff.patch #598938
	"${FILESDIR}"/${P}-CVE-2016-10266.patch
	"${FILESDIR}"/${P}-bug2598.patch
	"${FILESDIR}"/${P}-bug2604.patch
	"${FILESDIR}"/${P}-bug2608.patch
	"${FILESDIR}"/${P}-CVE-2016-10267.patch
	"${FILESDIR}"/${P}-bug2620.patch
	"${FILESDIR}"/${P}-bug2621.patch
	"${FILESDIR}"/${P}-bug2619.patch
	"${FILESDIR}"/${P}-bug2594.patch
	"${FILESDIR}"/${P}-bug2597.patch
	"${FILESDIR}"/${P}-bug2599.patch
	"${FILESDIR}"/${P}-bug2607.patch
	"${FILESDIR}"/${P}-bug2610.patch
	"${FILESDIR}"/${P}-bug2605.patch
	"${FILESDIR}"/${P}-hylafax-hack.patch #612172
	"${FILESDIR}"/${P}-bug2633-bug2634.patch
	"${FILESDIR}"/${P}-bug2635.patch
	"${FILESDIR}"/${P}-bug2627.patch
	"${FILESDIR}"/${P}-bug2638.patch
	"${FILESDIR}"/${P}-bug2639.patch
	"${FILESDIR}"/${P}-bug2640.patch
	"${FILESDIR}"/${P}-bug2653.patch
	"${FILESDIR}"/${P}-bug2535.patch
	"${FILESDIR}"/${P}-bug2644.patch
	"${FILESDIR}"/${P}-bug2642-bug2643-bug2646-bug2647.patch
	"${FILESDIR}"/${P}-bug2648.patch
	"${FILESDIR}"/${P}-bug2650.patch
	"${FILESDIR}"/${P}-bug2658.patch
	"${FILESDIR}"/${P}-bug2650-2.patch
	"${FILESDIR}"/${P}-bug2651.patch
	"${FILESDIR}"/${P}-CVE-2017-5225.patch #610330
	"${FILESDIR}"/${P}-bug2130.patch
	"${FILESDIR}"/${P}-bug2659.patch
	"${FILESDIR}"/${P}-bug2659-2.patch
	"${FILESDIR}"/${P}-bug2631.patch
	"${FILESDIR}"/${P}-bug2665.patch
)

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/tiffconf.h
)

src_prepare() {
	default

	# tiffcp-thumbnail.sh fails as thumbnail binary doesn't get built anymore since tiff-4.0.7
	sed '/tiffcp-thumbnail\.sh/d' -i test/Makefile.am || die

	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable static-libs static) \
		$(use_enable zlib) \
		$(use_enable jpeg) \
		$(use_enable jbig) \
		$(use_enable lzma) \
		$(use_enable cxx) \
		--without-x

	# remove useless subdirs
	if ! multilib_is_native_abi ; then
		sed -i \
			-e 's/ tools//' \
			-e 's/ contrib//' \
			-e 's/ man//' \
			-e 's/ html//' \
			Makefile || die
	fi
}

multilib_src_test() {
	if ! multilib_is_native_abi ; then
		emake -C tools
	fi
	emake check
}

multilib_src_install_all() {
	prune_libtool_files --all
	rm -f "${ED}"/usr/share/doc/${PF}/{COPYRIGHT,README*,RELEASE-DATE,TODO,VERSION}
}

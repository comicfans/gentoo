# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22"

inherit cmake-utils multilib ruby-ng

DESCRIPTION="A cross-platform ruby library for retrieving facts from operating systems"
HOMEPAGE="http://www.puppetlabs.com/puppet/related-projects/facter/"
SRC_URI="https://github.com/puppetlabs/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${S}/all/${P}"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="debug test"
KEYWORDS="amd64 ~hppa ~ppc64 x86"

BDEPEND="
	>=sys-devel/gcc-4.8:*
	>=dev-libs/boost-1.54[nls]
	>=dev-libs/leatherman-0.9.3
	>=dev-cpp/yaml-cpp-0.5.1
	dev-cpp/cpp-hocon"
CDEPEND="
	dev-libs/openssl:*
	sys-apps/util-linux
	app-emulation/virt-what
	net-misc/curl
	!<app-admin/puppet-4.0.0"

RDEPEND="${CDEPEND}"
DEPEND="${BDEPEND}
	${CDEPEND}"

src_prepare() {
	# Remove the code that installs facter.rb to the wrong directory.
	sed -i '/install(.*facter\.rb/d' lib/CMakeLists.txt || die
	sed -i '/install(.*facter\.jar/d' lib/CMakeLists.txt || die
	# make it support multilib
	sed -i "s/\ lib)/\ $(get_libdir))/g" lib/CMakeLists.txt || die
	sed -i "s/lib\")/$(get_libdir)\")/g" CMakeLists.txt || die
	# patches
	epatch "${FILESDIR}/facter-3.5.0-jar.patch"
	epatch_user
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_VERBOSE_MAKEFILE=ON
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_SYSCONFDIR=/etc
		-DCMAKE_INSTALL_LOCALSTATEDIR=/var
		-DUSE_JRUBY_SUPPORT=FALSE
		-DBLKID_LIBRARY=/$(get_libdir)/libblkid.so.1
	)
	if use debug; then
		mycmakeargs+=(
		  -DCMAKE_BUILD_TYPE=Debug
		)
	fi
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

each_ruby_install() {
	doruby "${BUILD_DIR}"/lib/facter.rb
}

src_test() {
	cmake-utils_src_test
}

src_install() {
	cmake-utils_src_install
	ruby-ng_src_install
	if [[ $(get_libdir) == lib64 ]]; then
		dodir /usr/lib64
		mv "${D}/usr/lib/"* "${D}/usr/lib64/"
		rmdir "${D}/usr/lib"
	fi
	doenvd "${FILESDIR}"/00facterdir
}

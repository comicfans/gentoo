# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $id$

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit eutils flag-o-matic cmake-utils python-single-r1 versionator

DESCRIPTION="Libs for the efficient manipulation of volumetric data"
HOMEPAGE="http://www.openvdb.org"

SRC_URI="https://github.com/dreamworksanimation/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+abi3-compat doc python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="sys-libs/zlib
	>=dev-libs/boost-1.62:=[python?,${PYTHON_USEDEP}]
	media-libs/openexr:=
	media-libs/glfw:=
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXinerama
	x11-libs/libXcursor
	dev-libs/jemalloc
	>=dev-libs/c-blosc-1.5.0
	dev-libs/log4cplus
	python? (
		${PYTHON_DEPS}
		dev-python/numpy[${PYTHON_USEDEP}]
	)"

DEPEND="${RDEPEND}
	dev-cpp/tbb
	doc? ( app-doc/doxygen[latex] )"

PATCHES=( "${FILESDIR}/${P}-make-docs-optional.patch"
	  "${FILESDIR}/${P}-build-docs-once.patch"
	  "${FILESDIR}/${P}-namespace-fixes.patch"
	  "${FILESDIR}/${P}-python-module-install-dir-fix.patch"
)

src_configure() {
	local myprefix="${EPREFIX}"/usr/

	# To stay in sync with Boost
	append-cxxflags -std=c++14

	# Hack so OpenVDB can find the right versions
	local ilmbase_version=$(best_version media-libs/ilmbase)
	ilmbase_version=${ilmbase_version/media-libs\/ilmbase-/}
	local openexr_version=$(best_version media-libs/openexr)
	openexr_version=${openexr_version/media-libs\/openexr-/}

	# Enable unit tests later in 4.0.1
	local mycmakeargs=(
		-DOPENVDB_BUILD_UNITTESTS=OFF
		-DOPENVDB_BUILD_DOCS=$(usex doc)
		-DOPENVDB_BUILD_PYTHON_MODULE=$(usex python)
		-DOPENVDB_ENABLE_3_ABI_COMPATIBLE=$(usex abi3-compat)
		-DBLOSC_LOCATION="${myprefix}"
		-DGLEW_LOCATION="${myprefix}"
		-DUSE_GLFW3=ON
		-DGLFW3_LOCATION="${myprefix}"
		-DILMBASE_LOCATION="${myprefix}"
		-DILMBASE_NAMESPACE_VERSIONING=ON
		-DILMBASE_VERSION_MAJOR=$(get_version_component_range 1 ${ilmbase_version})
		-DILMBASE_VERSION_MINOR=$(get_version_component_range 2 ${ilmbase_version})
		-DOPENEXR_LOCATION="${myprefix}"
		-DOPENEXR_NAMESPACE_VERSIONING=ON
		-DOPENEXR_VERSION_MAJOR=$(get_version_component_range 1 ${openexr_version})
		-DOPENEXR_VERSION_MINOR=$(get_version_component_range 2 ${openexr_version})
		-DTBB_LOCATION="${myprefix}"
	)

	use python && mycmakeargs+=( -DPYOENVDB_INSTALL_DIRECTORY=$(python_get_sitedir) )

	cmake-utils_src_configure
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

# Python 3: https://github.com/google/google-apputils/issues/9
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Collection of utilities for building Python applications"
HOMEPAGE="https://github.com/google/google-apputils"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~s390 ~sh ~x86"
IUSE="test"

RDEPEND="
	dev-python/namespace-google[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-1.4[${PYTHON_USEDEP}]
	>=dev-python/python-gflags-1.4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2010[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( ${RDEPEND} dev-python/mox[${PYTHON_USEDEP}] )"

src_unpack() {
	default
	chmod -R a+rX,u+w,g-w,o-w ${P} || die
}

python_test() {
	esetup.py google_test
}

python_install_all() {
	distutils-r1_python_install_all

	find "${D}" -name '*.pth' -delete || die
}

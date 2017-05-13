# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy{,3} )

inherit distutils-r1

MY_P="path.py-${PV}"

DESCRIPTION="A module wrapper for os.path"
HOMEPAGE="http://pythonhosted.org/path.py https://pypi.python.org/pypi/path.py https://github.com/jaraco/path.py"
SRC_URI="mirror://pypi/p/path.py/${MY_P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~m68k ~mips ppc64 ~s390 ~sh x86 ~amd64-linux ~x86-linux"
IUSE="test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/appdirs[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_P}"

python_prepare_all() {
	sed '/setuptools_scm/d' -i setup.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	# https://github.com/jaraco/path.py/issues/122
	unset XDG_CONFIG_HOME
	esetup.py test
}

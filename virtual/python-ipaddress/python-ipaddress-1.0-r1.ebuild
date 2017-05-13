# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )

inherit python-r1

DESCRIPTION="A virtual for Python ipaddress module"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ~m68k ~mips ppc64 ~s390 ~sh x86 ~x64-cygwin ~amd64-linux ~x86-linux"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/ipaddress[${PYTHON_USEDEP}]' \
	python2_7 pypy)"

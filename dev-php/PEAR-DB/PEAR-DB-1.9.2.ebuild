# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit php-pear-r1

KEYWORDS="alpha amd64 arm hppa ppc64 ~s390 ~sh x86"

DESCRIPTION="Database abstraction layer for PHP"
LICENSE="PHP-3"
SLOT="0"
IUSE="test"

src_test() {
	# Requires the "pear" executable from dev-php/PEAR-PEAR, and also
	# a working version of the cli SAPI eselected.
	pear run-tests tests || die

	# The command succeeds regardless of whether or not the test suite
	# passed, but this file is only written when there was a failure.
	[[ -f run-tests.log ]] && die "test suite failed"
}

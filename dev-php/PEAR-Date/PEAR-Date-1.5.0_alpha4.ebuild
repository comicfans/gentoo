# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit php-pear-r1

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc64 ~s390 ~sh ~x86"

DESCRIPTION="Date and Time Zone classes"
LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="|| ( <dev-php/PEAR-PEAR-1.71
	dev-php/PEAR-Console_Getopt )"
RDEPEND=""

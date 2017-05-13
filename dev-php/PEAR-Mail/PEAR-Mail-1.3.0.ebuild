# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit php-pear-r1

DESCRIPTION="Class that provides multiple interfaces for sending emails"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ppc64 ~s390 ~sh x86"
IUSE=""

RDEPEND=">=dev-php/PEAR-Net_SMTP-1.4.1"

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=RCLAMP
MODULE_VERSION=1.02
inherit perl-module

DESCRIPTION="Expand filenames"

SLOT="0"
KEYWORDS="~alpha amd64 ~ppc64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Module-Build"

SRC_TEST="do"

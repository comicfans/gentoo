# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=RJBS
MODULE_VERSION=0.814
inherit perl-module

DESCRIPTION="Determine the type of a mail folder"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc64 ~x86"
IUSE=""

RDEPEND="dev-perl/Module-Pluggable"
DEPEND="${RDEPEND}"

SRC_TEST="do"

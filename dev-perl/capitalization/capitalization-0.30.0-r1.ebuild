# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MIYAGAWA
MODULE_VERSION=0.03
inherit perl-module

DESCRIPTION="no capitalization on method names"

SLOT="0"
KEYWORDS="alpha amd64 hppa x86"
IUSE=""

RDEPEND="dev-perl/Devel-Symdump"
DEPEND="${RDEPEND}"

SRC_TEST="do"

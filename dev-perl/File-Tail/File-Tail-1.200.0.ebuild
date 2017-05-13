# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MGRABNAR
MODULE_VERSION=1.2
inherit perl-module

DESCRIPTION="Perl extension for reading from continously updated files"

SLOT="0"
KEYWORDS="alpha amd64 hppa ppc64 x86"
IUSE=""

RDEPEND="
	virtual/perl-Time-HiRes
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
"

mydoc="ToDo"

SRC_TEST="do parallel"

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=BBB
MODULE_VERSION=1.16
inherit perl-module

DESCRIPTION="Manage IO on many file handles "

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~mips ppc64 x86 ~x86-fbsd"
IUSE=""

DEPEND="virtual/perl-ExtUtils-MakeMaker"

SRC_TEST="do"

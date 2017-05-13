# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=SALVA
MODULE_VERSION=0.04
inherit perl-module

DESCRIPTION="SASL DIGEST-MD5 authentication (RFC2831)"

SLOT="0"
KEYWORDS="alpha amd64 ppc64 x86"
IUSE=""

SRC_TEST="do"

export OPTIMIZE="$CFLAGS"

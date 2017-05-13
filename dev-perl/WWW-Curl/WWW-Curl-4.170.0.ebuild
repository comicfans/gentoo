# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=SZBALINT
MODULE_VERSION=4.17
inherit perl-module

DESCRIPTION="Perl extension interface for libcurl"

LICENSE="|| ( MPL-1.0 MPL-1.1 MIT )"
SLOT="0"
KEYWORDS="amd64 ~ppc64 x86"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

SRC_TEST=online

PATCHES=("${FILESDIR}"/${PN}-4.150.0-curl-7.50.2.patch)

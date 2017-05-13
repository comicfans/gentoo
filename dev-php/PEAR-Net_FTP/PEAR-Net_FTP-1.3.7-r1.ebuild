# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit php-pear-r1

DESCRIPTION="Provides an OO interface to the PHP FTP functions"

LICENSE="PHP-3"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ppc64 ~s390 ~sh x86"
IUSE=""

RDEPEND="dev-lang/php[ftp]"

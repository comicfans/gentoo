# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for ${PN#perl-}"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 ~s390 ~sh x86 ~ppc-aix ~ppc-macos ~x86-solaris"

RDEPEND="
	|| ( =dev-lang/perl-5.22* ~perl-core/${PN#perl-}-${PV} )
	dev-lang/perl:=
	!<perl-core/${PN#perl-}-${PV}
	!>perl-core/${PN#perl-}-${PV}-r999
"

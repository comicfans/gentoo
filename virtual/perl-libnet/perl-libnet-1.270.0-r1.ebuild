# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Some important notes about detecting libnet version
# https://dev.gentoo.org/~zlogene/perl-libnet-mantainer-notes

# perl-5.20 probably was 1.260 (which is not on cpan anymore)
# lets stabilize this one day together with dev-lang/perl-5.20

EAPI=5

DESCRIPTION="Virtual for ${PN#perl-}"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa m68k ~mips ppc64 s390 sh x86 ~ppc-aix ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

RDEPEND="
	~perl-core/${PN#perl-}-${PV}
	dev-lang/perl:=
"

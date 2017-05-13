# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for IMAP c-client"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~mips ppc64 s390 sh x86 ~x86-fbsd"

RDEPEND="|| (	net-libs/c-client
				net-mail/uw-imap )"

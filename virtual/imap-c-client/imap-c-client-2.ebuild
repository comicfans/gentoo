# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Virtual for IMAP c-client"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~mips ~ppc64 ~s390 ~sh ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE="kerberos ssl"

RDEPEND=" || (	net-libs/c-client[kerberos=,ssl=]
				net-mail/uw-imap[kerberos=,ssl=] )"

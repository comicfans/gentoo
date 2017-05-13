# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for the w3m web browser"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~arm64 ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris"

RDEPEND="|| ( www-client/w3m
		www-client/w3mmee )"

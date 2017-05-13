# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools-multilib

DESCRIPTION="set of utility libraries (mostly used by sssd)"
HOMEPAGE="https://fedorahosted.org/sssd"
SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.gz"

LICENSE="LGPL-3 GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~mips ~ppc64 ~s390 ~sh ~x86 ~amd64-linux"
IUSE="test static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-libs/check )"

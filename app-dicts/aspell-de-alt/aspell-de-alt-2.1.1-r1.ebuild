# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ASPELL_LANG="German (traditional orthography)"
ASPELL_VERSION=6

inherit aspell-dict-r1

LICENSE="GPL-2"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~mips ppc64 s390 sh x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd"
IUSE=""

PATCHES=( "${FILESDIR}/${P}-dict-name.patch" )

src_install() {
	aspell-dict-r1_src_install

	newdoc doc/README README.hk
	dodoc doc/README.bj
}

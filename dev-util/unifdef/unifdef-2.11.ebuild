# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit toolchain-funcs

DESCRIPTION="remove #ifdef'ed lines from a file while otherwise leaving the file alone"
HOMEPAGE="http://dotat.at/prog/unifdef/"
SRC_URI="http://dotat.at/prog/unifdef/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~m68k ~mips ~ppc64 ~s390 ~sh ~x86 -sparc-fbsd -x86-fbsd ~amd64-linux ~x86-linux"

DOCS=( README )

src_prepare() {
	sed -i "/^prefix/s:=.*:=${EPREFIX}/usr:" Makefile || die
	tc-export CC
}

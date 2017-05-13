# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit font

DESCRIPTION="Mikachan Japanese TrueType Collection fonts"
HOMEPAGE="http://mikachan-font.com/"
# taken from
#SRC_URI="http://mikachan.sourceforge.jp/mikachanALL.exe
#	http://mikachan.sourceforge.jp/puchi.exe"
SRC_URI="mirror://gentoo/${P/-ttc/}.tar.bz2
	https://dev.gentoo.org/~usata/${P/-ttc/}.tar.bz2"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ppc64 s390 sh x86 ~x86-fbsd"
IUSE=""

FONT_S="${WORKDIR}/${P/-ttc}"
FONT_SUFFIX="ttc"

# Only installs fonts
RESTRICT="strip binchecks"

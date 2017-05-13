# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

MYSPELL_DICT=(
	"id_ID.aff"
	"id_ID.dic"
)

MYSPELL_HYPH=(
	"hyph_id_ID.dic"
)

MYSPELL_THES=(
)

inherit myspell-r2

DESCRIPTION="Indonesian dictionaries for myspell/hunspell"
HOMEPAGE="http://extensions.libreoffice.org/extension-center/indonesian-dictionary-kamus-indonesia-by-benitius"
SRC_URI="http://extensions.libreoffice.org/extension-center/indonesian-dictionary-kamus-indonesia-by-benitius/releases/${PV}/id_id.oxt -> ${P}.oxt"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~mips ppc64 ~sh x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

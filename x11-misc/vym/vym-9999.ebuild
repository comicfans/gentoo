# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PLOCALES="cs_CZ de_DE el es fr ia it ja pt_BR ru sv zh_CN zh_TW"

inherit eutils git-r3 l10n qmake-utils

DESCRIPTION="View Your Mind, a mindmap tool"
HOMEPAGE="http://www.insilmaril.de/vym/"
EGIT_REPO_URI="git://git.code.sf.net/p/${PN}/code"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="dbus"

RDEPEND="
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsvg:5
	dev-qt/qtxml:5
	dbus? ( dev-qt/qtdbus:5 )
"
DEPEND="
	${RDEPEND}
	dev-qt/linguist-tools:5
"

DOCS=( README.md )

src_prepare() {
	default

	remove_locale() {
		sed -i \
			-e "/TRANSLATIONS += lang\/vym.${1}.ts/d" \
			vym.pro || die
	}

	#remove dead en translation
	rm lang/vym.en.ts || die
	remove_locale en

	l10n_find_plocales_changes lang ${PN}. .ts
	l10n_for_each_disabled_locale_do remove_locale

	"$(qt5_get_bindir)"/lrelease vym.pro || die
}

src_configure() {
	eqmake5 vym.pro \
		PREFIX="${EPREFIX}"/usr \
		DATADIR="${EPREFIX}"/usr/share \
		$(usex dbus "" NO_DBUS=1 )
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs
	doman doc/vym.1.gz

	make_desktop_entry vym vym /usr/share/vym/icons/vym.png Education
}

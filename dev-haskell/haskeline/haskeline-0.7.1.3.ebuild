# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A command-line interface for user input, written in Haskell"
HOMEPAGE="http://trac.haskell.org/haskeline"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="alpha amd64 ppc64 x86 ~x86-fbsd ~ppc-macos ~x86-macos"
IUSE="legacy-encoding libiconv +terminfo"

RDEPEND=">=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	legacy-encoding? ( >=dev-haskell/utf8-string-0.3.6:=[profile?] <dev-haskell/utf8-string-0.4:=[profile?] )
	terminfo? ( >=dev-haskell/terminfo-0.3.1.3:=[profile?] <dev-haskell/terminfo-0.5:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag legacy-encoding legacy-encoding) \
		$(cabal_flag libiconv libiconv) \
		$(cabal_flag terminfo terminfo)
}

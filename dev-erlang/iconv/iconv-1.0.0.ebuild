# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Fast encoding conversion library for Erlang and Elixir"
HOMEPAGE="https://github.com/processone/iconv"
SRC_URI="https://github.com/processone/${PN}/archive/${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm x86"

DEPEND=">=dev-lang/erlang-17.1
	virtual/libiconv"
RDEPEND="${DEPEND}"

DOCS=( README.md )

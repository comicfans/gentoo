# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit rebar

DESCRIPTION="Erlang clients for Riak"
HOMEPAGE="https://github.com/basho/riak-erlang-client"
SRC_URI="https://github.com/basho/riak-erlang-client/archive/${PV}.tar.gz"
S="${WORKDIR}/riak-erlang-client-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~sparc ~x86"

DEPEND=">=dev-erlang/riak_pb-2.1.4.1
	>=dev-lang/erlang-17.1"
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_prepare() {
	rebar_src_prepare
	# 'priv' directory contains only edoc.css, but doc isn't going to be built.
	rm -r "${S}/priv" || die
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
GST_ORG_MODULE=gst-plugins-ugly

inherit gstreamer

DESCRIPTION="ATSC A/52 audio decoder plugin for GStreamer"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="+orc"

RDEPEND="
	>=media-libs/a52dec-0.7.4-r6[${MULTILIB_USEDEP}]
	orc? ( >=dev-lang/orc-0.4.17[${MULTILIB_USEDEP}] )
"
DEPEND="${RDEPEND}"

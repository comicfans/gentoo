# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit vim-plugin

DESCRIPTION="vim plugin: interface for browsing ri/ruby documentation"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=494"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/ruby"

VIM_PLUGIN_HELPFILES="ri.txt"
VIM_PLUGIN_MESSAGES="filetype"

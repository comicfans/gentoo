# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

inherit virtualx ruby-ng-gnome2

DESCRIPTION="Ruby Gtk2 bindings"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND+=" x11-libs/gtk+:2
	x11-themes/hicolor-icon-theme"
RDEPEND+=" x11-libs/gtk+:2"

ruby_add_bdepend ">=dev-ruby/ruby-glib2-${PV}
	>=dev-ruby/ruby-pango-${PV}"
ruby_add_rdepend ">=dev-ruby/ruby-gdkpixbuf2-${PV}
	>=dev-ruby/ruby-atk-${PV}
	>=dev-ruby/ruby-pango-${PV}"

all_ruby_prepare() {
	# Avoid compilation of dependencies during test.
	sed -i -e '/system/,/^  end/ s:^:#:' test/run-test.rb || die
}

each_ruby_test() {
	VIRTUALX_COMMAND=${RUBY}
	virtualmake test/run-test.rb || die
}

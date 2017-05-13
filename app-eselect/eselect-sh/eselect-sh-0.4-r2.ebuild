# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Manages the /bin/sh (POSIX shell) symlink"
HOMEPAGE="https://www.gentoo.org/proj/en/eselect/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~m68k ~mips ppc64 s390 sh x86 ~amd64-linux ~x86-linux ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="app-eselect/eselect-lib-bin-symlink"

S=${FILESDIR}

src_install() {
	insinto /usr/share/eselect/modules
	newins sh.eselect-${PVR} sh.eselect
}

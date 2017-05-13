# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="exFAT filesystem FUSE module"
HOMEPAGE="https://github.com/relan/exfat"
SRC_URI="https://github.com/relan/exfat/releases/download/v${PV}/${P}.tar.gz"

# COPYING is GPL-2 but ChangeLog says "Relicensed the project from GPLv3+ to GPLv2+"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~m68k ~mips ~ppc64 ~s390 ~sh ~x86 ~arm-linux ~x86-linux"

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( ChangeLog )

src_install() {
	default
	dosym mount.exfat-fuse.8 /usr/share/man/man8/mount.exfat.8
}

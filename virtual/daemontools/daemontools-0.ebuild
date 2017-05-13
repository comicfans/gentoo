# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for daemontools"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa m68k ~mips ppc64 s390 sh x86 ~x86-fbsd"

RDEPEND="|| (
	sys-process/daemontools
	sys-process/daemontools-encore
)"

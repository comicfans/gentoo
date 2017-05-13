# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit multilib-build

DESCRIPTION="Virtual for libusb"
SLOT="1"
KEYWORDS="alpha amd64 arm arm64 hppa m68k ~mips ppc64 s390 sh x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="udev"

RDEPEND="|| ( >=dev-libs/libusb-1.0.9-r2:1[udev(+)?,${MULTILIB_USEDEP}] >=sys-freebsd/freebsd-lib-9.1-r10[usb,${MULTILIB_USEDEP}] )"

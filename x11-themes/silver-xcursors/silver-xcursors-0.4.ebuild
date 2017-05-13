# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

MY_P="5533-Silver-XCursors-3D-${PV}"
DESCRIPTION="A high quality set of Xfree 4.3.0 animated mouse cursors"
HOMEPAGE="http://www.kde-look.org/content/show.php?content=5533"
SRC_URI="http://www.kde-look.org/CONTENT/content-files/$MY_P.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 hppa ~mips x86 ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dodir /usr/share/cursors/xorg-x11/Silver/cursors/
	cp -R  "${WORKDIR}"/${MY_P:5}/Silver/cursors "${D}"/usr/share/cursors/xorg-x11/Silver/ || die
	dodoc "${WORKDIR}"/${MY_P:5}/README
}

pkg_postinst() {
	einfo "To use this set of cursors, edit or create the file ~/.Xdefaults"
	einfo "and add the following line:"
	einfo "Xcursor.theme: Silver"
	einfo ""
	einfo "You can change the size by adding a line like:"
	einfo "Xcursor.size: 48"
	einfo ""
	einfo "Also, to globally use this set of mouse cursors edit the file:"
	einfo "   /usr/share/cursors/xorg-x11/default/index.theme"
	einfo "and change the line:"
	einfo "    Inherits=[current setting]"
	einfo "to"
	einfo "    Inherits=Silver"
	einfo ""
	einfo "Note this will be overruled by a user's ~/.Xdefaults file."
	einfo ""
	ewarn "If you experience flickering, try setting the following line in"
	ewarn ""
	ewarn "the Device section of your xorg.conf file:"
	ewarn "    Option  \"HWCursor\"  \"false\""
}

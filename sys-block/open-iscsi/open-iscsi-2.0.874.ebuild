# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator linux-info flag-o-matic toolchain-funcs udev

DESCRIPTION="A performant, transport independent, multi-platform implementation of RFC3720"
HOMEPAGE="http://www.open-iscsi.org/"
SRC_URI="http://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~mips ~ppc64 ~x86"
IUSE="debug infiniband slp +tcp rdma"

DEPEND="sys-block/open-isns:=
	slp? ( net-libs/openslp )
	infiniband? ( sys-fabric/ofed )"
RDEPEND="${DEPEND}
	sys-fs/lsscsi
	sys-apps/util-linux"
REQUIRED_USE="infiniband? ( rdma ) || ( rdma tcp )"

PATCHES=(
	"${FILESDIR}/${P}-Makefiles.patch"
	"${FILESDIR}/${P}-musl-fixes.patch"
	"${FILESDIR}/${P}-musl-ethtool-compat.patch"
)

pkg_setup() {
	linux-info_pkg_setup

	if kernel_is -lt 2 6 16; then
		die "Sorry, your kernel must be 2.6.16-rc5 or newer!"
	fi

	# Needs to be done, as iscsid currently only starts, when having the iSCSI
	# support loaded as module. Kernel builtin options don't work. See this for
	# more information:
	# https://groups.google.com/group/open-iscsi/browse_thread/thread/cc10498655b40507/fd6a4ba0c8e91966
	# If there's a new release, check whether this is still valid!
	TCP_MODULES="SCSI_ISCSI_ATTRS ISCSI_TCP"
	RDMA_MODULES="INFINIBAND_ISER"
	INFINIBAND_MODULES="INFINIBAND_IPOIB INIBAND_USER_MAD INFINIBAND_USER_ACCESS"
	CONFIG_CHECK_MODULES="tcp? ( ${TCP_MODULES} ) rdma? ( ${RDMA_MODULES} ) infiniband? ( ${INFINIBAND_MODULES} )"
	if linux_config_exists; then
		if use tcp; then
			for module in ${TCP_MODULES}; do
				linux_chkconfig_module ${module} || ewarn "${module} needs to be built as module (builtin doesn't work)"
		done
		fi
		if use infiniband; then
			for module in ${INFINIBAND_MODULES}; do
				linux_chkconfig_module ${module} || ewarn "${module} needs to be built as module (builtin doesn't work)"
		done
		fi
		if use rdma; then
			for module in ${RDMA_MODULES}; do
				linux_chkconfig_module ${module} || ewarn "${module} needs to be built as module (builtin doesn't work)"$
			done
		fi
	fi
}

src_prepare() {
	sed -i -e 's:^\(iscsid.startup\)\s*=.*:\1 = /usr/sbin/iscsid:' etc/iscsid.conf || die
	default
}

src_configure() {
	use debug && append-cppflags -DDEBUG_TCP -DDEBUG_SCSI
	append-lfs-flags
}

src_compile() {
	# Stuffing CPPFLAGS into CFLAGS isn't entirely correct, but the build
	# is messed up already here, so it's not making it that much worse.
	KSRC="${KV_DIR}" CFLAGS="" \
	emake \
		OPTFLAGS="${CFLAGS} ${CPPFLAGS}" \
		AR="$(tc-getAR)" CC="$(tc-getCC)" \
		user
}

src_install() {
	emake DESTDIR="${ED}" sbindir="/usr/sbin" install

	dodoc README THANKS

	docinto test/
	dodoc test/*

	insinto /etc/iscsi
	newins "${FILESDIR}"/initiatorname.iscsi initiatorname.iscsi.example

	# udev pieces
	udev_dorules "${FILESDIR}"/99-iscsi.rules
	exeinto /etc/udev/scripts
	doexe "${FILESDIR}"/iscsidev.sh

	newconfd "${FILESDIR}"/iscsid-conf.d iscsid
	newinitd "${FILESDIR}"/iscsid-init.d iscsid

	keepdir /var/db/iscsi
	fperms 700 /var/db/iscsi
	fperms 600 /etc/iscsi/iscsid.conf
}

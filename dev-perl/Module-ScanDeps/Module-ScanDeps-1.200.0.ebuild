# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=RSCHUPP
MODULE_VERSION=1.20
inherit perl-module

DESCRIPTION="Recursively scan Perl code for dependencies"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ppc64 ~s390 ~sh x86 ~x86-fbsd ~amd64-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="test"

RDEPEND="
	virtual/perl-File-Spec
	virtual/perl-File-Temp
	virtual/perl-Getopt-Long
	virtual/perl-Module-Metadata
	virtual/perl-Text-ParseWords
	virtual/perl-version
"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.590.0
	test? (
		virtual/perl-Test-Simple
		dev-perl/prefork
		dev-perl/Module-Pluggable
		dev-perl/Test-Requires
	)
"

SRC_TEST="do parallel"

src_test() {
	perl_rm_files t/0-pod.t
	perl-module_src_test
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for Linear Algebra Package FORTRAN 77 (LAPACK) implementation"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc64 x86 ~x86-fbsd"

RDEPEND="|| (
		sci-libs/lapack-reference
		>=sci-libs/mkl-9.1.023
	)"

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Virtual package for FFmpeg implementation"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~mips ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos ~x86-solaris"
IUSE="X +encode gsm jpeg2k libav mp3 sdl speex theora threads truetype vaapi vdpau x264"

RDEPEND="
	!libav? ( >=media-video/ffmpeg-0.10.3:0[X?,encode?,gsm?,jpeg2k?,mp3?,sdl?,speex?,theora?,threads?,truetype?,vaapi?,vdpau?,x264?] )
	libav? ( >=media-video/libav-0.8.4[X?,encode?,gsm?,jpeg2k?,mp3?,sdl?,speex?,theora?,threads?,truetype?,vaapi?,vdpau?,x264?] )
"

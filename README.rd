= clockcount

clockcount access processor specific clock counter.

== Usage

  require 'clockcount'
  p ClockCount()

== Sample Script to Mesure Clock Speed

  % ruby sample.rb
  0x18a9c616f16d5
  0x18a9caca6f864 1.2640276924433[GHz]    3.97282828038034[day]
  0x18a9cf9ac9d9c 1.29211869909757[GHz]   3.88646950425614[day]
  0x18a9d4772970a 1.30474179349239[GHz]   3.84888032793389[day]
  0x18a9d93b80a6a 1.27955467871139[GHz]   3.92465434730725[day]
  ...

== Download

  ((<URL:http://cvs.m17n.org/viewcvs/ruby/clockcount.tar.gz?view=tar>))

== Install

  ruby extconf.rb
  make
  make install

== Supported Platforms

* Intel Pentium (rdtsc, 64bit)
* AMD64, Intel EM64T (rdtsc, 64bit)
* Intel Itanium (IA64) (ar44 register, 64bit)
* PowerPC (PowerPC603, POWER3 or later) (mftb and mftbu, 64bit)
* Sun UltraSparc (tick register, 64bit)
* HP PA-RISC 2.0 (cr16 register, 64bit)

== Note

The meaning of "clock" varys on platforms.
For example, the counter doesn't count CPU clocks on PowerPC.

== License

  Copyright (C) 2005,2006 Tanaka Akira. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:
  1. Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.

(2-clause FreeBSD style BSD License)

== Author
Tanaka Akira <akr@m17n.org>

= clockcount

clockcount access processor specific clock counter.

== Usage

  require 'clockcount'
  p ClockCount()

== Sample Script to Mesure Clock Speed

  % ruby sample.rb 
  0x171faf0c3cbed
  0x171fb3e46f666 1.30258316772774[GHz]
  0x171fb8a2981c2 1.27298907227854[GHz]
  0x171fbd7ae77dc 1.30054508000412[GHz]
  0x171fc21e131d4 1.24473258972987[GHz]
  0x171fc6d123ecf 1.26146415868276[GHz]

== Install

  ruby extconf.rb
  make
  make install

== Supported Platforms

* Intel Pentium (rdtsc, 64bit)
* AMD64, Intel EM64T (rdtsc, 64bit)
* Intel Itanium (IA64) (ar44 register, 64bit)
* PowerPC (POWER3, PowerPC603 or later) (mftb and mftbu, 64bit)
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

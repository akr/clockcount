= clockcount

clockcount access processor specific clock counter.

== Usage

  require 'clockcount'
  p ClockCount()

== Sample Script to Mesure Clock Speed

  % ruby sample.rb     
  371254883337042 1250109646.8873[clock/sec]
  371256128197122 1244767967.17043[clock/sec]
  371257378461133 1250206501.50093[clock/sec]
  371258629206976 1250396982.24195[clock/sec]
  ...

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

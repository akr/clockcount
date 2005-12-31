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

* Intel Pentium
  rdtsc, 64bit
* AMD64, Intel EM64T
  rdtsc, 64bit
* Intel Itanium (IA64)
  ar44 register, 64bit
* PowerPC (POWER3, PowerPC603 or later)
  mftb and mftbu, 64bit
* Sun UltraSparc
  tick register, 64bit
* HP PA-RISC 2.0
  cr16 register, 64bit

== Note

The meaning of "clock" varys on platforms.
For example, the counter doesn't count CPU clocks on PowerPC.

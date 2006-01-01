# Copyright (C) 2005,2006 Tanaka Akira. All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

require 'clockcount'

STDOUT.sync = true

c1 = ClockCount()
t1 = Time.now
puts "0x#{'%x' % c1}"
loop {
  sleep 1
  c2 = ClockCount()
  t2 = Time.now
  speed = (c2-c1)/(t2-t1)
  if 1000000000000 < speed then speed /= 1000000000000; unit = 'THz'
  elsif 1000000000 < speed then speed /= 1000000000; unit = 'GHz'
  elsif 1000000 < speed then speed /= 1000000; unit = 'MHz'
  elsif 1000 < speed then speed /= 1000; unit = 'kHz'
  else unit = 'Hz'
  end
  puts "0x#{'%x' % c2}\t#{speed}[#{unit}]"
  c1 = c2
  t1 = t2
}

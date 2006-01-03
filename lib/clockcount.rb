# Copyright (C) 2006 Tanaka Akira. All rights reserved.
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

require 'clockcount.so'

if ClockCount::CLOCKCOUNT_BITS < 64
  require 'thread'

  class << ClockCount
    alias RawClockCount ClockCount
    public :RawClockCount

    attr_accessor :clock_hi
    attr_accessor :clock_lo
  end

  module ClockCount
    HI_STEP = 1 << ClockCount::CLOCKCOUNT_BITS
  end

  ClockCount.clock_hi = 0
  ClockCount.clock_lo = ClockCount.RawClockCount

  module Kernel
    module_function

    def ClockCount
      Thread.exclusive {
	c2 = ClockCount.RawClockCount
	ClockCount.clock_hi += ClockCount::HI_STEP if ClockCount.clock_lo > c2
	ClockCount.clock_lo = c2
	ClockCount.clock_hi + c2
      }
    end

    Thread.new { 
      while true 
	ClockCount() # call redefined version
	sleep 1 # shold work if less than 4GHz.
      end
    } 
  end
end

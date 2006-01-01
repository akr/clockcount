require 'clockcount.so'

if ClockCount::CLOCKCOUNT_BITS == 32
  require 'thread'

  class << ClockCount
    alias ClockCount32 ClockCount
    public :ClockCount32

    attr_accessor :clock_hi
    attr_accessor :clock_lo
  end

  ClockCount.clock_hi = 0
  ClockCount.clock_lo = ClockCount.ClockCount32

  module Kernel
    module_function

    def ClockCount
      Thread.exclusive {
	c2 = ClockCount.ClockCount32
	ClockCount.clock_hi += 1 if ClockCount.clock_lo > c2
	ClockCount.clock_lo = c2
	ClockCount.clock_hi * 0x100000000 + c2
      }
    end

    Thread.new { 
      while true 
	ClockCount() # call redefined version
	sleep 1
      end
    } 
  end
end

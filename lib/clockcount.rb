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
	sleep 1
      end
    } 
  end
end

require 'clockcount'

c1 = ClockCount()
t1 = Time.now
loop {
  sleep 1
  c2 = ClockCount()
  t2 = Time.now
  puts "#{(c2-c1)/(t2-t1)}[clock/sec]"
  c1 = c2
  t1 = t2
}

require 'mkmf'

$objs = ["clockcount.o"]

platform = CROSS_COMPILING || RUBY_PLATFORM
case platform
when /i[3456]86/
  $objs << "x86.o"
else
  raise "not supported: #{platform}"
end

create_makefile('clockcount')


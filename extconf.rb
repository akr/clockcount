require 'mkmf'

$objs = ["clockcount.o"]

platform = CROSS_COMPILING || RUBY_PLATFORM
case platform
when /i[3456]86/
  $objs << "x86.o"
when /x86_64/
  $objs << "x86_64.o"
else
  puts "not supported: #{platform}"
  exit 1
end

create_makefile('clockcount')


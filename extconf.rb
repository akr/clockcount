require 'mkmf'

$objs = ["clockcount.o"]

platform = CROSS_COMPILING || RUBY_PLATFORM
case platform
when /\Ai[3456]86-/
  $objs << "x86.o"
when /\Ax86_64/
  $objs << "x86_64.o"
when /\Aia64-/
  $objs << "ia64.o"
when /\Asparc-/
  $objs << "sparc.o"
when /\Apowerpc-/
  $objs << "powerpc.o"
else
  puts "not supported: #{platform}"
  exit 1
end

create_makefile('clockcount')


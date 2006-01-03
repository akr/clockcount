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

require 'mkmf'

$objs = ["clockcount.o"]

platform = CROSS_COMPILING || RUBY_PLATFORM
puts "platform: #{platform}"
case platform
when /\Ai[3456]86-/
  $objs << "x86.o"
  bits = 64
when /\Ax86_64-/
  $objs << "x86_64.o"
  bits = 64
when /\Aia64-/
  $objs << "ia64.o"
  bits = 64
when /\Asparc-/
  bits = 64
  is_sparcv9 = try_compile(<<'End')
#if !defined(__sparcv9)
# error "not SPARC-V9"
#endif
End
  $ASFLAGS = ''
  if is_sparcv9
    $ASFLAGS << ' -xarch=v9' 
    $objs << "sparc64.o"
  else
    $ASFLAGS << ' -xarch=v8plus' 
    $objs << "sparc.o"
  end
when /\Apowerpc-/
  $objs << "powerpc.o"
  bits = 64
when /\Ahppa2\.0w-/
  $objs << "hppa.o"
  bits = 64
when /\Aalpha/ # alpha, alphaev6, alphaev68, etc.
  $objs << "alpha.o"
  bits = 32
else
  puts "not supported: #{platform}"
  exit 1
end

$CFLAGS << " -DCLOCKCOUNT_BITS=#{bits}"

create_makefile('clockcount')

open("Makefile", "ab") {|mfile|
  mfile.puts "ASFLAGS = #$ASFLAGS" if defined? $ASFLAGS
}


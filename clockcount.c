#include "ruby.h"

extern unsigned long long clockcount(void);

static VALUE
clockcount_m(VALUE self)
{
  return ULL2NUM(clockcount());
}

void
Init_clockcount()
{
  rb_define_global_function("ClockCount", clockcount_m, 0);
}


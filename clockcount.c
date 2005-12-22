#include "ruby.h"

extern long long clockcount(void);

static VALUE
clockcount_m(VALUE self)
{
  return LL2NUM(clockcount());
}

void
Init_clockcount()
{
  rb_define_global_function("ClockCount", clockcount_m, 0);
}


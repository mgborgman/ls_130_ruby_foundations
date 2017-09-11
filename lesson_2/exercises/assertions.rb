assert_equal(true, value.odd?)

assert_equal('xyz', value.downcase)

assert_nil(value)

assert_empty(list)

assert_includes(list, 'xyz')

assert_raises(NoExperienceError){|_| employee.hire}

assert_instance_of(Numeric, value)

assert_kind_of(Numeric, value)

assert_same(list, list.process)

refute_inclues(list, 'xyz')

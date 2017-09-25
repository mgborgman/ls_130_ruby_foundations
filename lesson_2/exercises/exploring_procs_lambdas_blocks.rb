my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)
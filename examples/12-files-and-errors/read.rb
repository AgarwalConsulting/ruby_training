f = File.open("/tmp/forbidden/unicorn")

contents = f.read

f.each_line {|line| puts line}

f.close()

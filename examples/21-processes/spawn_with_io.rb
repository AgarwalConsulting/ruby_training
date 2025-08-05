r, w = IO.pipe
pid = spawn("cat", in: r, out: STDOUT)
w.puts "Hello via spawn"
w.close
r.close
Process.wait(pid)

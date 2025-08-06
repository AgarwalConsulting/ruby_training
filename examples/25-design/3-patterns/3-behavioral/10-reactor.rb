# ## ⚡ **Reactor**

# ### ✅ **What it is:**

# A non-blocking I/O loop that **reacts** to events (I/O readiness, timers) using a **single thread**.

# ### 🔧 **Why you need it:**

# To handle **multiple I/O sources efficiently** (e.g., inputs, sockets, timers) **without using threads**, which are heavier in constrained environments.

# ### 🛠️ **Typical uses:**

# * CLI event loops
# * Embedded command processors
# * TCP/UDP servers without threads
# * Serial/GPIO polling loops

server = TCPServer.new(1234)
clients = []

loop do
  ready = IO.select([server] + clients)
  readable = ready[0]

  readable.each do |sock|
    if sock == server
      client = server.accept
      clients << client
      client.puts "Welcome!"
    else
      msg = sock.gets
      if msg
        sock.puts "Echo: #{msg}"
      else
        clients.delete(sock)
        sock.close
      end
    end
  end
end

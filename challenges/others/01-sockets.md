# Socket exercises

---

## ✅ **1. TCP Echo Server and Client**

**Objective:**
Create a TCP server that echoes back whatever message it receives from the client.

### 📄 Server (echoes data back)

* Listen on `localhost:5000`
* For every client connection, read input and send the same string back

### 📄 Client

* Connect to the server
* Send a string (e.g., `"Hello from client"`)
* Print the echoed response

**Stretch goal:**

* Handle multiple clients using `Thread` or `fork`

---

## 🌐 **2. UDP Echo Server and Client**

**Objective:**
Create a UDP server that receives a message and replies back with the same data.

### 📄 Server

* Listen on `localhost:6000`
* When it receives a datagram, send the same content back to the sender

### 📄 Client

* Send a message (e.g., `"Ping via UDP"`) to the server
* Receive and print the echoed reply

**Stretch goal:**

* Add a simple command-line interface that allows the user to type messages continuously

---

## 🧬 **3. ICMP Ping using Raw Sockets (ROOT required)**

**Objective:**
Craft a raw ICMP Echo Request packet manually, send it to a public IP (like `8.8.8.8`), and print a confirmation after sending.

### 🛠️ Tasks:

* Build ICMP header (`type = 8`, `code = 0`, etc.)
* Compute ICMP checksum
* Use `Socket.new(AF_INET, SOCK_RAW, IPPROTO_ICMP)`
* Send packet to `8.8.8.8`
* Optionally, listen for an Echo Reply

**Stretch goal (advanced):**

* Parse the reply (type = 0, code = 0)
* Calculate round-trip time (RTT)
* Retry ping 3 times with timeout handling

---

## 🧪 Bonus: Platform-Dependent Validation

**Tasks:**

* On Linux, try reading `/proc/net/tcp` and `/proc/net/udp` to validate your server bindings
* Use `lsof -i :<port>` to confirm listening sockets

---

## ✍️ Sample Exercise Format

You can implement each as a `ruby` script:

```
tcp_echo_server.rb
tcp_echo_client.rb
udp_echo_server.rb
udp_echo_client.rb
icmp_ping.rb
```

---

## ✅ Suggested Implementation Order

1. TCP Echo Server (easy)
2. UDP Echo Server (easy but needs `recvfrom/send`)
3. ICMP Raw Socket Ping (requires root, low-level)

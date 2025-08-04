# 🔧 Exercise 1: Ruby on Buildroot (QEMU ARM)

**Objective:**
Build a minimal Linux system using Buildroot that includes the full Ruby interpreter and runs a custom Ruby script at boot using QEMU ARM.

**Steps:**

1. **Prepare Buildroot:**

   ```bash
   git clone https://github.com/buildroot/buildroot.git
   cd buildroot
   make qemu_arm_defconfig
   ```

2. **Enable Ruby in Menuconfig:**

   ```bash
   make menuconfig
   ```

   * `Target packages` → `Interpreter languages and scripting` → `ruby` → \[\*]
   * (Optional) Add a Ruby script to run at boot:

     * `System configuration` → `Custom scripts to run at bootup` → `/etc/init.d/S99ruby_hello`

3. **Add custom Ruby script:**
   Create a new file in `board/qemu/arm/ruby_hello.rb`:

   ```ruby
   puts "Hello from Ruby on Buildroot!"
   ```

   Then in `target/board/qemu/arm/post-build.sh`:

   ```bash
   #!/bin/sh
   cp board/qemu/arm/ruby_hello.rb ${TARGET_DIR}/root/
   echo '/usr/bin/ruby /root/ruby_hello.rb' >> ${TARGET_DIR}/etc/init.d/S99ruby_hello
   chmod +x ${TARGET_DIR}/etc/init.d/S99ruby_hello
   ```

   Make it executable:

   ```bash
   chmod +x board/qemu/arm/post-build.sh
   ```

   And link it in `make menuconfig`:

   * `System configuration` → `Custom post-build script` → `board/qemu/arm/post-build.sh`

4. **Build and Run:**

   ```bash
   make
   output/images/qemu-arm -nographic -kernel output/images/zImage -M versatilepb -append "console=ttyAMA0" -dtb output/images/versatile-pb.dtb -initrd output/images/rootfs.ext2
   ```

   You should see:

   ```
   Hello from Ruby on Buildroot!
   ```

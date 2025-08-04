# 🧩 Exercise 2: Ruby Layer on Yocto (QEMU x86-64)

**Objective:**
Build a Yocto image for QEMU x86\_64 with Ruby installed using a custom layer, and run a Ruby script on boot.

**Steps:**

1. **Setup Yocto (e.g., poky):**

   ```bash
   git clone -b kirkstone https://git.yoctoproject.org/git/poky
   cd poky
   source oe-init-build-env
   ```

2. **Add meta-openembedded (for ruby):**

   ```bash
   cd ../
   git clone -b kirkstone https://github.com/openembedded/meta-openembedded.git
   cd poky
   ```

   Add to `conf/bblayers.conf`:

   ```bash
   BBLAYERS += "${TOPDIR}/../meta-openembedded/meta-oe"
   ```

3. **Add Ruby to image:**
   Edit `conf/local.conf`:

   ```bash
   IMAGE_INSTALL:append = " ruby"
   ```

4. **Create a custom image or append a postinstall script:**
   Optionally create your own image recipe (`meta-myimage/recipes-core/images/my-ruby-image.bb`) or append Ruby script to run:

   ```bash
   mkdir -p meta-myimage/recipes-core/images
   echo 'inherit core-image
   IMAGE_INSTALL:append = " ruby"
   ROOTFS_POSTPROCESS_COMMAND += "cp ${THISDIR}/hello.rb ${IMAGE_ROOTFS}/root/; echo \"/usr/bin/ruby /root/hello.rb\" >> ${IMAGE_ROOTFS}/etc/rc.local;"
   ' > meta-myimage/recipes-core/images/my-ruby-image.bb
   ```

   And create `meta-myimage/recipes-core/images/hello.rb`:

   ```ruby
   puts "Hello from Ruby on Yocto!"
   ```

5. **Build and Run:**

   ```bash
   bitbake my-ruby-image
   runqemu qemux86-64
   ```

   You should see:

   ```
   Hello from Ruby on Yocto!
   ```

# 🏗️ Exercise Goal

Enable **Ruby 3.3 with YJIT** on Digi Embedded Yocto (DEY), and run a small benchmark with `--yjit`.

---

## ✅ Background

YJIT (Yet another JIT) is a **just-in-time compiler for Ruby**. It's available in **Ruby ≥ 3.1**, but **enabled by default in 3.3** for supported platforms.

> **Caveat**: YJIT works **only on x86\_64 and aarch64**, **not** on 32-bit ARM (like Cortex-A7 in CC6UL). So the exercise below assumes **aarch64 target** (like **CC8X** or QEMU aarch64) or **native x86\_64** testing.

---

## 🧪 Step-by-Step Exercise

### 1. **Clone DEY**

```bash
git clone https://github.com/digi-embedded/dey.git
cd dey
git checkout v2.4
```

### 2. **Setup environment**

```bash
source dey-setup-environment
```

Choose a **target machine** that is **aarch64** (e.g., `ccimx8x-sbc-pro` or use aarch64 QEMU if testing off-board).

---

### 3. **Add meta-ruby layer**

In `sources/`, clone meta-ruby:

```bash
cd sources
git clone https://github.com/meta-ruby/meta-ruby.git
```

Then add it to `bblayers.conf`:

```bash
bitbake-layers add-layer ../sources/meta-ruby
```

---

### 4. **Enable Ruby 3.3 with YJIT**

In your `local.conf`:

```conf
PREFERRED_VERSION_ruby = "3.3.0"
```

Then patch or extend the `ruby_3.3.0.bb` recipe if needed.

To **ensure YJIT is built**, the Ruby build must include:

```bash
--enable-yjit
```

You can confirm that by extending the recipe in `meta-ruby`:

#### `recipes-devtools/ruby/ruby_3.3.0.bbappend`

```bash
EXTRA_OECONF_append = " --enable-yjit"
```

Or override `EXTRA_OECONF` fully to match Ruby’s autoconf options.

---

### 5. **Build Ruby**

```bash
bitbake ruby
```

---

### 6. **Test YJIT on Target**

Deploy to your target (real or QEMU), then SSH in and run:

```bash
ruby --yjit -e 'puts RubyVM::YJIT.enabled?'
```

You should see:

```
true
```

Try a small benchmark:

```bash
ruby --yjit -e '100000.times { "hello".sub(/l/, "L") }'
```

Compare with `--disable-yjit` to see performance difference.

---

## ⚠️ Notes

* **Ruby 3.3 requires LLVM ≥ 13** to enable YJIT. Check that DEY is using compatible LLVM (or build Ruby with `--disable-YJIT` if testing on 32-bit).
* **DEY 2.4 = Yocto Rocko**, which is quite old. You may want to update or override `ruby_3.3.0.bb` to build with a newer toolchain or build Ruby manually.

---

## 🧩 Alternative (Manual Ruby Build)

If the meta-ruby recipe is too old:

```bash
bitbake -c devshell ruby
```

Then manually:

```bash
./configure --enable-yjit
make -j4
make install
```

---

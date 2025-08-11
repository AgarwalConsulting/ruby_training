# =====================================================
# Digi Embedded Yocto build container with Ruby
# =====================================================
FROM ubuntu:22.04

ARG DEY_BRANCH="scarthgap"        # Change to desired DEY branch/tag
ARG MACHINE="ccimx8mmqemu"        # Refer README.md
ARG JOBS=8

# -----------------------------------------------------
# Install dependencies
# -----------------------------------------------------
RUN apt-get update && apt-get install -y \
    git curl wget python3 python3-pip locales \
    gawk diffstat unzip texinfo gcc g++ \
    build-essential chrpath socat cpio python3-pexpect \
    xz-utils debianutils iputils-ping python3-git \
    python3-jinja2 libegl1-mesa libsdl1.2-dev \
    pylint3 xterm repo bsdmainutils \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------
# Create build directory
# -----------------------------------------------------
WORKDIR /dey

# -----------------------------------------------------
# Fetch DEY sources
# -----------------------------------------------------
RUN repo init -u https://github.com/digi-embedded/dey-manifest.git -b ${DEY_BRANCH} && \
    repo sync -j${JOBS} --no-repo-verify

# -----------------------------------------------------
# Add meta-ruby layer
# -----------------------------------------------------
WORKDIR /dey/sources
RUN git clone https://github.com/meta-ruby/meta-ruby.git

# -----------------------------------------------------
# Add custom layers for startup Ruby script & optional binary
# -----------------------------------------------------
WORKDIR /dey/sources/meta-custom
RUN mkdir -p recipes-core/startup-ruby/files \
           recipes-utils/mybinary/files

# --- Startup Ruby script ---
COPY start.rb recipes-core/startup-ruby/files/start.rb
RUN printf '%s\n' \
"SUMMARY = \"Startup Ruby Script\"" \
"LICENSE = \"MIT\"" \
"SRC_URI = \"file://start.rb\"" \
"S = \"\${WORKDIR}\"" \
"do_install() {" \
"    install -d \${D}\${bindir}" \
"    install -m 0755 start.rb \${D}\${bindir}/start.rb" \
"}" \
> recipes-core/startup-ruby/startup-ruby_1.0.bb

# --- Optional binary ---
COPY mybinary.c recipes-utils/mybinary/files/mybinary.c
RUN printf '%s\n' \
"SUMMARY = \"My Optional Binary\"" \
"LICENSE = \"MIT\"" \
"SRC_URI = \"file://mybinary.c\"" \
"S = \"\${WORKDIR}\"" \
"do_compile() {" \
"    \${CC} mybinary.c -o mybinary" \
"}" \
"do_install() {" \
"    install -d \${D}\${bindir}" \
"    install -m 0755 mybinary \${D}\${bindir}/mybinary" \
"}" \
"INSANE_SKIP:\${PN} += \"already-stripped\"" \
> recipes-utils/mybinary/mybinary_1.0.bb

# -----------------------------------------------------
# Custom image recipe
# -----------------------------------------------------
RUN mkdir -p recipes-core/images
RUN printf '%s\n' \
"SUMMARY = \"Minimal image with Ruby, script, and binary\"" \
"LICENSE = \"MIT\"" \
"inherit core-image" \
"IMAGE_INSTALL += \"ruby startup-ruby mybinary\"" \
> recipes-core/images/my-ruby-image.bb

# -----------------------------------------------------
# Configure build environment
# -----------------------------------------------------
WORKDIR /dey
RUN . ./dey-setup-environment ${MACHINE} && \
    bitbake-layers add-layer ../sources/meta-ruby && \
    bitbake-layers add-layer ../sources/meta-custom && \
    echo 'PREFERRED_VERSION_ruby = "3.3.0"' >> conf/local.conf && \
    echo 'EXTRA_OECONF:append:pn-ruby = " --disable-install-doc --enable-yjit"' >> conf/local.conf && \
    echo 'INSANE_SKIP:pn-ruby += "already-stripped"' >> conf/local.conf && \
    echo 'IMAGE_FSTYPES += "tar.bz2 ext4"' >> conf/local.conf

# -----------------------------------------------------
# Build the image
# -----------------------------------------------------
RUN . ./dey-setup-environment ${MACHINE} && \
    bitbake my-ruby-image

# Final stage could copy artifacts out if needed

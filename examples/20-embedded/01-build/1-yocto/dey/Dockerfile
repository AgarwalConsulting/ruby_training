FROM ubuntu:22.04

ARG DEY_BRANCH="kirkstone"        # Use a valid DEY branch name
ARG MACHINE="ccimx8mmqemu"
ARG JOBS=8

ENV DEBIAN_FRONTEND=noninteractive

# --- Install build dependencies ---
RUN apt-get update && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && apt-get install -y \
    git curl wget python3 python3-pip locales \
    gawk diffstat unzip texinfo gcc g++ \
    build-essential chrpath socat cpio python3-pexpect \
    xz-utils debianutils iputils-ping python3-git \
    python3-jinja2 libegl1-mesa libsdl1.2-dev \
    python3-pip xterm repo bsdmainutils tree \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global user.email "gaurav@codermana.com"
RUN git config --global user.name "GA"

RUN pip3 install pylint

# --- Fetch DEY sources ---
WORKDIR /dey
RUN repo init -u https://github.com/digi-embedded/dey-manifest.git -b ${DEY_BRANCH} && \
    repo sync -j${JOBS} --no-repo-verify

# --- Detect DEY directory ---
# (Example: dey-4.0 or dey-3.2, adjust if needed)
WORKDIR /dey/${DEY_BRANCH}

# --- Add meta-openembedded (for meta-ruby) ---
WORKDIR /dey/${DEY_BRANCH}/sources
RUN git clone --branch scarthgap --single-branch git://git.openembedded.org/meta-openembedded

# --- Create meta-custom layer ---
WORKDIR /dey/${DEY_BRANCH}/sources
RUN mkdir -p meta-custom/conf && \
    echo "BBPATH .= \":\${LAYERDIR}\"" > meta-custom/conf/layer.conf && \
    echo "BBFILES += \"\${LAYERDIR}/recipes-*/*/*.bb\"" >> meta-custom/conf/layer.conf && \
    echo "BBFILE_COLLECTIONS += \"meta-custom\"" >> meta-custom/conf/layer.conf && \
    echo "BBFILE_PATTERN_meta-custom = \"^${LAYERDIR}/\"" >> meta-custom/conf/layer.conf

# --- Add startup Ruby script recipe ---
RUN mkdir -p meta-custom/recipes-core/startup-ruby/files
COPY start.rb meta-custom/recipes-core/startup-ruby/files/start.rb
RUN printf '%s\n' \
"SUMMARY = \"Startup Ruby Script\"" \
"LICENSE = \"MIT\"" \
"SRC_URI = \"file://start.rb\"" \
"S = \"\${WORKDIR}\"" \
"do_install() {" \
"    install -d \${D}\${bindir}" \
"    install -m 0755 start.rb \${D}\${bindir}/start.rb" \
"}" \
> meta-custom/recipes-core/startup-ruby/startup-ruby_1.0.bb

# --- Add optional binary recipe ---
RUN mkdir -p meta-custom/recipes-utils/mybinary/files
COPY mybinary.c meta-custom/recipes-utils/mybinary/files/mybinary.c
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
> meta-custom/recipes-utils/mybinary/mybinary_1.0.bb

# --- Custom image recipe ---
RUN mkdir -p meta-custom/recipes-core/images
RUN printf '%s\n' \
"SUMMARY = \"Minimal image with Ruby, script, and binary\"" \
"LICENSE = \"MIT\"" \
"inherit core-image" \
"IMAGE_INSTALL += \"ruby startup-ruby mybinary\"" \
> meta-custom/recipes-core/images/my-ruby-image.bb

# --- Configure environment ---
WORKDIR /dey/${DEY_BRANCH}
# RUN . ./dey-setup-environment ${MACHINE} && \
#     bitbake-layers add-layer ../sources/meta-openembedded/meta-ruby && \
#     bitbake-layers add-layer ../sources/meta-custom && \
#     echo 'PREFERRED_VERSION_ruby = "3.3.0"' >> conf/local.conf && \
#     echo 'EXTRA_OECONF:append:pn-ruby = " --disable-install-doc --enable-yjit"' >> conf/local.conf && \
#     echo 'INSANE_SKIP:pn-ruby += "already-stripped"' >> conf/local.conf && \
#     echo 'IMAGE_FSTYPES += "tar.bz2 ext4"' >> conf/local.conf

# # --- Build image ---
# RUN . ./dey-setup-environment ${MACHINE} && \
#     bitbake my-ruby-image

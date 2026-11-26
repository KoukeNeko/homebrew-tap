class Fcitx5Projectkey < Formula
  desc "Zhuyin input method for Fcitx5"
  homepage "https://github.com/KoukeNeko/Project-Key"
  url "https://github.com/KoukeNeko/Project-Key/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "94b3e567c484fe2cfa65839e99e69323efde0260d4982fe4e61ee7aab928bfdc"
  license all_of: ["MIT", "CC-BY-SA-4.0", "LGPL-2.1-or-later", "Unicode-3.0", "Apache-2.0"]  # the program; bigram.bin, chars.bin and sentence.bin; data.txt; emoji.txt; TSCharacters.txt

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on :linux

  resource "mcbopomofo" do
    url "https://github.com/openvanilla/McBopomofo/archive/257da536ddaf590aae0e74e6adb9b415988344f6.tar.gz"
    sha256 "77b7b67a90c0adfaf4ff884ca74d29c663ee961c13656d922ead864f66cdd09e"
  end

  resource "llama.cpp" do
    url "https://github.com/ggml-org/llama.cpp/archive/refs/tags/b12283.tar.gz"
    sha256 "1e951b20323b74a502e086d292c4127051820950c1ab3876fdd065c21890bde8"
  end

  resource "data.txt" do
    url "https://github.com/KoukeNeko/Project-Key/releases/download/models-2026-11-27/data.txt"
    sha256 "7e329eb5a496969dfd7df34910e88f40d2fae7baacdc89f687658f855a6c3a5a"
  end

  resource "bigram.bin" do
    url "https://github.com/KoukeNeko/Project-Key/releases/download/models-2026-11-27/bigram.bin"
    sha256 "bff91ebb8910cf6265a28c27b266bbf8b09f2e0f72423b17a8969cfd91df5b95"
  end

  resource "chars.bin" do
    url "https://github.com/KoukeNeko/Project-Key/releases/download/models-2026-11-27/chars.bin"
    sha256 "dbdff0b7159d72833f86e455edcb48655129f58a9b29e8108cf90b43d8a375ac"
  end

  resource "sentence.bin" do
    url "https://github.com/KoukeNeko/Project-Key/releases/download/models-2026-11-27/sentence.bin"
    sha256 "6708f36fb538c788d49495b9a042abe6d54ebf2a7d4cb44be6103afd0034fa7f"
  end

  def install
    # The addon is loaded by the distribution's Fcitx5, so it is built with the system's
    # compiler, against the system's Fcitx5, Qt and other libraries (see caveats).
    ENV["PKG_CONFIG"] = "/usr/bin/pkg-config"
    ENV["PKG_CONFIG_LIBDIR"] =
      Utils.safe_popen_read("/usr/bin/pkg-config", "--variable", "pc_path", "pkg-config").strip
    ENV.delete "PKG_CONFIG_PATH"
    (buildpath/"mcbopomofo").install resource("mcbopomofo")
    (buildpath/"llama.cpp").install resource("llama.cpp")  # the advanced model's
    # CMakeLists.txt installs them, with their notice, from the trainer's cache.
    %w[data.txt bigram.bin chars.bin sentence.bin].each { |file| (buildpath/"tools/bigram-trainer/.cache").install resource(file) }
    (buildpath/"tools/bigram-trainer/.cache/models-version.txt").write "2026-11-27\n"  # as fetch-models.sh records it
    system "make", "-C", "mcbopomofo/Source/Data", "data.txt", "associated-phrases-v2.txt"
    system "cmake", "-S", "platforms/linux", "-B", "build", "-G", "Ninja",
           "-DCMAKE_C_COMPILER=/usr/bin/cc", "-DCMAKE_CXX_COMPILER=/usr/bin/c++",
           "-DMCBOPOMOFO=#{buildpath}/mcbopomofo", "-DREQUIRE_MODELS=ON",
           "-DPROJECTKEY_LLAMA=#{buildpath}/llama.cpp", *std_cmake_args
    system "cmake", "--build", "build"
    %w[ComposerTest ControllerTest].each { |test| system "build/#{test}", "mcbopomofo/Source/Data/data.txt" }
    system "cmake", "--install", "build"

    # Fcitx5, GNOME Shell and the desktop also read the user's data directory, where Homebrew
    # cannot write: projectkey-link links the files they read there, to opt so upgrades keep them.
    (bin/"projectkey-link").write <<~SH
      #!/bin/sh
      set -e
      data=${XDG_DATA_HOME:-$HOME/.local/share}
      for file in fcitx5/addon/projectkey.conf fcitx5/inputmethod/projectkey.conf fcitx5/themes/projectkey \\
                  gnome-shell/extensions/project-key@koukeneko.github.io applications/projectkey-settings.desktop \\
                  icons/hicolor/scalable/apps/fcitx-projectkey.svg \\
                  icons/hicolor/scalable/apps/fcitx-projectkey-symbolic.svg; do
        mkdir -p "$data/$(dirname "$file")"
        rm -rf "${data:?}/$file"
        ln -s "#{opt_share}/$file" "$data/$file"
      done
      echo "Linked Project Key into $data. Restart Fcitx5 (fcitx5 -r), then run projectkey-settings --welcome to add it."
    SH
    chmod 0755, bin/"projectkey-link"
  end

  def caveats
    <<~EOS
      Built against the system's Fcitx5. On Debian or Ubuntu first install:
        sudo apt install g++ python3 pkg-config libfcitx5core-dev libfcitx5config-dev libfcitx5utils-dev fcitx5-modules-dev libenchant-2-dev libxcb1-dev libcairo2-dev libpango1.0-dev libwayland-dev qt6-base-dev libadwaita-1-dev libsoup-3.0-dev libjson-glib-dev hunspell-en-us fonts-noto-cjk
      (on Plasma 5, qtbase5-dev too).

      Then run projectkey-link once: it links the files Fcitx5 and GNOME read into ~/.local/share.
      Restart Fcitx5 (fcitx5 -r) and add Project Key in Fcitx5's input methods. On GNOME, log in
      again and turn on the Project Key extension in the Extensions app.
    EOS
  end

  test do
    assert_path_exists lib/"fcitx5/projectkey.so"
    assert_match "Library=#{lib}/fcitx5/projectkey", (share/"fcitx5/addon/projectkey.conf").read
  end
end

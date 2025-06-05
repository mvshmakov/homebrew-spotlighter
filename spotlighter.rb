class Spotlighter < Formula
  desc "Manage Spotlight indexing exclusions"
  homepage "https://github.com/mvshmakov/spotlighter"
  url "https://github.com/mvshmakov/spotlighter/archive/6b054c7a71f8b8ffa20997461bcdaeed4066895d.tar.gz"
  version "0.1.0"
  sha256 "bc924b352e947ff892e933c9ae1312c927c8aab044c3ce50e69e249861230c3a"
  head "https://github.com/mvshmakov/spotlighter.git"
  license "MIT"

  def install
    script = buildpath/"spotlighter"
    bash_output = Utils.safe_popen_read(script, "completions", "bash")
    (buildpath/"spotlighter.bash").write bash_output
    zsh_output = Utils.safe_popen_read(script, "completions", "zsh")
    (buildpath/"_spotlighter").write zsh_output

    bin.install script
    bash_completion.install "spotlighter.bash" => "spotlighter"
    zsh_completion.install "_spotlighter"
  end

  test do
    system bin/"spotlighter", "-h"
  end
end

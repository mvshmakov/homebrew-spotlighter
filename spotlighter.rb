class Spotlighter < Formula
  desc "Manage Spotlight indexing exclusions"
  homepage "https://github.com/mvshmakov/spotlighter"
  url "https://github.com/mvshmakov/spotlighter/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "d8fd12214894d299561ec4cdd6ec71e83ec454045a3a3a7e8858e901e27488d9"
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

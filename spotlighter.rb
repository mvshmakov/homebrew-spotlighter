class Spotlighter < Formula
  desc "Manage Spotlight indexing exclusions"
  homepage "https://github.com/mvshmakov/spotlighter"
  url "https://github.com/mvshmakov/spotlighter/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "f500308915d039021657135258aa3dc56e31f309406fe5f989d53fab238aacfc"
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

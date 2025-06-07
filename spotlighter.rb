class Spotlighter < Formula
  desc "Manage Spotlight indexing exclusions"
  homepage "https://github.com/mvshmakov/spotlighter"
  url "https://github.com/mvshmakov/spotlighter/archive/256d4398c7e1a227a56bb5b30e7d88644f846a48.tar.gz"
  version "0.1.1"
  sha256 "7a1a34ce2becdc076d1a202f623d450837053c70e8d213d37a403a4235345ba9"
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

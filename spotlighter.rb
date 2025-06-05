class Spotlighter < Formula
  desc "Manage Spotlight indexing exclusions"
  homepage "https://github.com/mvshmakov/spotlighter"
  url "https://github.com/mvshmakov/spotlighter/archive/527aae7823f8c208e0cab46284adfb8fb2fa019f.tar.gz"
  version "0.1.0"
  sha256 "a8ab341eacd1c319906c0413ce7dc5ed8ebcafff651e150d7c94889eeb822904"
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

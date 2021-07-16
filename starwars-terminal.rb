# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class StarwarsTerminal < Formula
  desc "StarWars terminal themes inspired at Pokemon-Terminal. https://github.com/LazoCoder/Pokemon-Terminal"
  homepage "https://github.com/mokuo/starwars-terminal"
  url File.read(File.expand_path("../url.txt", __FILE__)).chomp
  sha256 File.read(File.expand_path("../sha256.txt", __FILE__)).chomp
  license ""

  depends_on "go" => :build

  def install
    cmd_path = buildpath/"cmd/sw/"
    img_path = bin/"images/"

    cd cmd_path do
      system "go", "build"
      bin.install "sw"
      img_path.install Dir["images/*"]
    end
  end

  test do
    assert_match "c-3po", shell_output("#{bin}/sw l")
    assert_match "bb-8", shell_output("#{bin}/sw list")
  end
end

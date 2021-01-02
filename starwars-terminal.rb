# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class StarwarsTerminal < Formula
  desc "StarWars terminal themes inspired at Pokemon-Terminal. https://github.com/LazoCoder/Pokemon-Terminal"
  homepage "https://github.com/mokuo/starwars-terminal"
  url "https://github.com/mokuo/starwars-terminal/archive/0.1.0.tar.gz"
  sha256 "234338597e5079538ae7677f1f0bff2c5bc08df1a2ae6700ae3ecd54a1ec3830"
  license ""

  depends_on "go" => :build

  def install
    cmd_path = buildpath/"cmd/starwars/"
    img_path = bin/"images/"

    cd cmd_path do
      system "go", "build"
      bin.install "starwars"
      img_path.install Dir["images/*"]
    end
  end

  test do
    assert_match "c-3po", shell_output("#{bin}/starwars l")
    assert_match "bb-8", shell_output("#{bin}/starwars list")
  end
end

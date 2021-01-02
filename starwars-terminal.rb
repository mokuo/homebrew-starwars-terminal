# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class StarwarsTerminal < Formula
  desc "StarWars terminal themes inspired at Pokemon-Terminal. https://github.com/LazoCoder/Pokemon-Terminal"
  homepage "https://github.com/mokuo/starwars-terminal"
  url "https://github.com/mokuo/starwars-terminal/archive/0.tar.gz"
  sha256 "a278784e852884d71b53cc4e5def3c4ec7952f94a4a69d5fee6d21d3555f3210"
  license ""

  depends_on "go" => :build

  def install
    ENV['GOPATH'] = buildpath
    starwars_path = buildpath/"src/github.com/mokuo/starwars-terminal/"
    starwars_path.install buildpath.children

    cd starwars_path/"cmd/starwars" do
      system "go", "build"
      bin.install "starwars"
    end

    cd starwars_path do
      prefix.install Dir["images/*"]
    end
  end

  test do
    assert_match "", shell_output("#{bin}/starwars")
    assert_match "", shell_output("#{bin}/starwars r2-d2")
    assert_match "c-3po", shell_output("#{bin}/starwars l")
    assert_match "bb-8", shell_output("#{bin}/starwars list")
  end
end

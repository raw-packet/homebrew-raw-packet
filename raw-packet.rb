class RawPacket < Formula
  
  desc "This project implements network protocols such as Ethernet ARP IPv4 UDP TCP DHCPv4 ICMPv4 IPv6 DHCPv6 ICMPv6 DNS MDNS on raw socket."
  homepage "https://github.com/raw-packet/raw-packet/tree/testing"
  url "https://github.com/raw-packet/raw-packet/archive/v0.2.1.tar.gz"
  sha256 "87ec91531e1256c1637017602dcd1bb3ed3b752d5abc2bb8d8ad2919ac50234a"
  head "https://github.com/raw-packet/raw-packet.git"
  
  depends_on "python"
  depends_on "wireshark"
  depends_on "nmap"
  
  resource "user-agents" do
    url "https://files.pythonhosted.org/packages/1b/be/82e4d20a7716d8e5de98b948edcecff9bb237e6718c3831bd92794fe9821/user-agents-2.1.tar.gz"
    sha256 "da54371d856c35d8ead0622da24ad5ef6d667eda3629a750e3373a3e847a054b"
  end

   resource "requests" do
    url "https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915/requests-2.23.0.tar.gz"
    sha256 "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
  end
  
  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python3.7/site-packages"
    %w[user-agents requests].each do |r|
      resource(r).stage do
        system "python3", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python3.7/site-packages"
    system "python3", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end

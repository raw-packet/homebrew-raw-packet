class RawPacket < Formula
  desc "This project implements network protocols such as Ethernet ARP IPv4 UDP TCP DHCPv4 ICMPv4 IPv6 DHCPv6 ICMPv6 DNS MDNS on raw socket."
  homepage "https://github.com/raw-packet/raw-packet/tree/testing"
  url "https://github.com/raw-packet/raw-packet/archive/v0.2.1.tar.gz"
  sha256 "87ec91531e1256c1637017602dcd1bb3ed3b752d5abc2bb8d8ad2919ac50234a"
  head "https://github.com/raw-packet/raw-packet.git"

  depends_on "python@3.8"
  depends_on "wireshark"
  depends_on "nmap"

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"local/lib/python3.8/site-packages"
    system "python3", *Language::Python.setup_install_args(libexec)

    bin.install Dir["/usr/local/bin/*"]
    bin.env_script_all_files("/usr/local/bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end

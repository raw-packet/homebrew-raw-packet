class RawPacket < Formula
  desc "This project implements network protocols such as Ethernet ARP IPv4 UDP TCP DHCPv4 ICMPv4 IPv6 DHCPv6 ICMPv6 DNS MDNS on raw socket."
  homepage "https://github.com/raw-packet/raw-packet/tree/testing"
  url "https://github.com/raw-packet/raw-packet/archive/testing.zip"
  sha256 "7fd08469394fa2d9e2ee1460bf8d1e27bd7ae0142b3dca9c567210c440ec2b7c"
  head "https://github.com/raw-packet/raw-packet.git"

  depends_on "python@3.8"
  depends_on "wireshark"
  depends_on "nmap"

  def install
    bin.mkpath
    system "python3", "setup.py", "install"
  end
end

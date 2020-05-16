class RawPacket < Formula
  
  desc "This project implements network protocols such as Ethernet ARP IPv4 UDP TCP DHCPv4 ICMPv4 IPv6 DHCPv6 ICMPv6 DNS MDNS on raw socket."
  homepage "https://github.com/raw-packet/raw-packet/tree/testing"
  url "https://github.com/raw-packet/raw-packet/archive/v0.2.1.tar.gz"
  sha256 "87ec91531e1256c1637017602dcd1bb3ed3b752d5abc2bb8d8ad2919ac50234a"
  head "https://github.com/raw-packet/raw-packet.git"
  
  depends_on "python"
  depends_on "wireshark"
  depends_on "nmap"
  
  def install
    system "python3", "setup.py", "install", "--install-scripts=/usr/local/bin", "--install-lib=/usr/local/lib/python3.7/site-packages"
  end
end

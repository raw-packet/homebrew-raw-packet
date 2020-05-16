class RawPacket < Formula
  
  resource "raw_packet" do
    url "https://github.com/raw-packet/raw-packet/archive/v0.2.1.tar.gz"
    sha256 "87ec91531e1256c1637017602dcd1bb3ed3b752d5abc2bb8d8ad2919ac50234a"
  end
  
  depends_on "python@3.8"
  depends_on "wireshark"
  depends_on "nmap"

end

Pod::Spec.new do |s|
  s.name         = "nanopb"
  s.version      = "0.2.9.1"
  s.summary      = "Protocol buffers with small code size."

  s.description  = <<-DESC
                    Nanopb is a plain-C implementation of Google's 
                    [Protocol Buffers][pb] data format. It is targeted at 
                    32 bit microcontrollers, but is also fit for 
                    other embedded systems with tight (2-10 kB ROM, 
                    <1 kB RAM) memory constraints.

                     [pb]: https://developers.google.com/protocol-buffers/
                   DESC

  s.homepage     = "http://koti.kapsi.fi/jpa/nanopb/"
  s.license      = { :type => 'zlib', :file => 'LICENSE.txt' }
  s.author       = { "Petteri Aimonen" => "jpa@nanopb.mail.kapsi.fi" }
  s.source       = { :http => "http://koti.kapsi.fi/~jpa/nanopb/download/nanopb-#{s.version}.tar.gz" }
  s.requires_arc = false

  s.source_files  = '*.{h,c}'
  s.public_header_files  = '*.h'

  s.subspec 'encode' do |e|
    e.public_header_files = ['pb.h', 'pb_encode.h']
    e.source_files = ['pb.h', 'pb_encode.h', 'pb_encode.c']
  end

  s.subspec 'decode' do |d|
    d.public_header_files = ['pb.h', 'pb_decode.h']
    d.source_files = ['pb.h', 'pb_decode.h', 'pb_decode.c']
  end
end

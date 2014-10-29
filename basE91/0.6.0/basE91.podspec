Pod::Spec.new do |s|
  s.name         = "basE91"
  s.version      = "0.6.0"
  s.summary      = "basE91 is an advanced method for encoding binary data as ASCII characters."

  s.description  = <<-DESC
                     basE91 is an advanced method for encoding binary data as ASCII characters. 
                     It is similar to UUencode or base64, but is more efficient. The overhead 
                     produced by basE91 depends on the input data. It amounts at most to 23% 
                     (versus 33% for base64) and can range down to 14%, which typically occurs 
                     on 0-byte blocks. This makes basE91 very useful for transferring larger 
                     files over binary unsafe connections like e-mail or terminal lines.
                   DESC

  s.homepage     = "http://base91.sourceforge.net"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.author       = "Joachim Henke"
  s.source       = { :http => "http://downloads.sourceforge.net/base91/base91-0.6.0.tar.gz" }

  s.source_files = "base91.{c,h}"
  s.requires_arc = false
end

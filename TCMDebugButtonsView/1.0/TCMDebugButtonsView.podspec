Pod::Spec.new do |s|
  s.name         = "TCMDebugButtonsView"
  s.version      = "1.0"
  s.summary      = "Easily add debug buttons to your iOS app"

  s.description  = <<-DESC
                    * speed up the process of providing a user reachable button for features during development
                    * let it hide itself if it isn't needed so it doesn't interfere with screenshots
                    * give incentive to add debug facilities to your apps by making adding a rudimentary UI to reach them cheap
                   DESC

  s.homepage     = "https://github.com/monkeydom/TCMDebugButtonsView"

  s.license      = {:type => 'MIT', :text => <<-LICENSE
                      The MIT License (MIT)

                      Copyright (c) 2013 TheCodingMonkeys

                      Permission is hereby granted, free of charge, to any person obtaining a copy
                      of this software and associated documentation files (the "Software"), to deal
                      in the Software without restriction, including without limitation the rights
                      to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                      copies of the Software, and to permit persons to whom the Software is
                      furnished to do so, subject to the following conditions:

                      The above copyright notice and this permission notice shall be included in
                      all copies or substantial portions of the Software.

                      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                      IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                      FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                      AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                      LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                      OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
                      THE SOFTWARE.
                    LICENSE
                   }

  s.author       = { "Dominik Wagner" => "dom@codingmonkeys.de" }

  s.platform     = :ios

  s.source       = { :git => "https://github.com/monkeydom/TCMDebugButtonsView.git", :tag => "1.0" }

  s.source_files  = 'Sources/*.{h,m}'

  s.requires_arc = true
end

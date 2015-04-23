Pod::Spec.new do |s|
  s.name         = "libopus"
  s.version      = "1.1"
  s.summary      = "Opus is a totally open, royalty-free, highly versatile audio codec."

  s.description  = <<-DESC
                   Opus is a totally open, royalty-free, highly versatile audio codec. 
                   Opus is unmatched for interactive speech and music transmission over 
                   the Internet, but is also intended for storage and streaming 
                   applications. It is standardized by the Internet Engineering Task 
                   Force (IETF) as [RFC 6716][1] which incorporated technology from 
                   Skype's SILK codec and Xiph.Org's CELT codec.
                   
                    [1]: http://tools.ietf.org/html/rfc6716
                   DESC

  s.homepage     = "http://www.opus-codec.org/"

  s.license      = { :type => 'BSD', :file => 'COPYING' }

  s.author       = 'Xiph.Org', 'Skype Limited', 'Octasic',
                   'Jean-Marc Valin', 'Timothy B. Terriberry',
                   'CSIRO', 'Gregory Maxwell', 'Mark Borgerding',
                   'Erik de Castro Lopo'

  s.source       = { :http => "http://downloads.xiph.org/releases/opus/opus-#{s.version}.tar.gz" }
  s.requires_arc = false

  base_source_files = [
    'src/config.h', 'include/*.h', 
    'silk/*.{c,h}', 'celt/*.{c,h}'
  ]
  # Files from opus_sources.mk / opus_headers.mk
  base_source_files += [
    # OPUS_SOURCES
    "src/opus.c", "src/opus_decoder.c", "src/opus_encoder.c",
    "src/opus_multistream.c", "src/opus_multistream_encoder.c", "src/opus_multistream_decoder.c",
    "src/repacketizer.c",
    # OPUS_SOURCES_FLOAT
    "src/analysis.c", "src/mlp.c", "src/mlp_data.c",
    # OPUS_HEAD
    "include/opus.h", "include/opus_multistream.h", "src/opus_private.h", 
    "src/analysis.h", "src/mlp.h", "src/tansig_table.h"
  ]
  base_public_header_files = ['include/*.h']

  base_compiler_flags = ['-w', '-Xanalyzer', '-analyzer-disable-checker', '-DHAVE_CONFIG_H=1', '-O3']

  s.default_subspec = 'float'

  s.subspec 'fixed' do |fs|
    fs.source_files = base_source_files + ['silk/fixed']
    fs.public_header_files = base_public_header_files
    fs.exclude_files = "celt/opus_custom_demo.c"

    fs.compiler_flags = base_compiler_flags + ['-DFIXED_POINT']
  end
  s.subspec 'float' do |fs|
    fs.source_files = base_source_files + ['silk/float', 'celt/x86']
    fs.public_header_files = base_public_header_files
    fs.exclude_files = "celt/opus_custom_demo.c"

    fs.compiler_flags = base_compiler_flags + ['-DFLOATING_POINT']
  end

  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/libopus/silk"'
  }

  s.prepare_command = <<-CMD
cat >src/config.h <<CONFIG_H
#define HAVE_DLFCN_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_LRINT 1
#define HAVE_LRINTF 1
#define HAVE_MEMORY_H 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1

#define OPUS_BUILD /**/

#define STDC_HEADERS 1
#define VAR_ARRAYS 1

CONFIG_H
  CMD

end

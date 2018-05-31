
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag'      # MIT License
require 'laag/nasm' # BSD-2-Clause License
require_relative '../../../lib/laag/libjpeg-turbo'

NASM = File.join(LAAG.nasm.install_path, 'bin', 'nasm')

LAAG::BuildEnvironment
  .new(LAAG.libjpeg_turbo)
  .script { default!(configure: ["NASM=#{NASM}"]) }

create_makefile 'laag/libjpeg-turbo'

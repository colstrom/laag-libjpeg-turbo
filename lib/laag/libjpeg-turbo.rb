
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  LIBJPEG_TURBO_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  LIBJPEG_TURBO_ORIGIN  = 'github.com/libjpeg-turbo/libjpeg-turbo'
  LIBJPEG_TURBO_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-libjpeg-turbo-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(LIBJPEG_TURBO_GEM_ROOT)
      .match(%r{^laag-libjpeg-turbo-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.libjpeg_turbo
    @@libjpeg_turbo ||= Library.new(
      gem_root: LIBJPEG_TURBO_GEM_ROOT,
      origin:   LIBJPEG_TURBO_ORIGIN,
      version:  LIBJPEG_TURBO_VERSION
    )
  end
end

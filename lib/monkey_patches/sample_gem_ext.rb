require 'sample_gem/version'
unless SampleGem::VERSION == '0.1.0'
  raise 'Consider removing this patch'
end

module SampleKlassMonkeyPatch
  def increment
    Rails.logger.warn 'DEPRECATION WARNING: 使わないで！'
    super
  end
end
SampleGem::SampleKlass.prepend(SampleKlassMonkeyPatch)

module SampleKlassClassMethodMonkeyPatch
  def increment(num)
    super(num.to_i)
  end
end
SampleGem::SampleKlass.singleton_class.prepend(SampleKlassClassMethodMonkeyPatch)

SampleGem::SampleKlass::SAMPLE_CONST = 'hogehoge'

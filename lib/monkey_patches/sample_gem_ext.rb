require 'sample_gem/version'
unless SampleGem::VERSION == '0.1.0'
  raise 'Consider removing this patch'
end

module SampleKlassMonkeyPatch
  def initialize(num)
    raise SampleGem::NoIntegerError unless num == num.to_i

    @num = num.to_i * 2
  end

  def increment
    @num += 2
  end
end
SampleGem::SampleKlass.prepend(SampleKlassMonkeyPatch)

module SampleKlassClassMethodMonkeyPatch
  def increment(num)
    raise SampleGem::NoIntegerError unless num == num.to_i

    num + 2
  end
end
SampleGem::SampleKlass.singleton_class.prepend(SampleKlassClassMethodMonkeyPatch)

require 'sample_gem/version'
unless SampleGem::VERSION == '0.1.0'
  raise 'Consider removing this patch'
end

module SampleGemMonkeyPatch
end

SampleGem.prepend(SampleGemMonkeyPatch)

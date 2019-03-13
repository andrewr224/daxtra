# frozen_string_literal: true

require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/support/vcr"
  c.hook_into :webmock
end

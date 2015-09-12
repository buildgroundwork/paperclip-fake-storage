RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.profile_examples = 10
  config.order = :random
  Kernel.srand(config.seed)
end

require 'paperclip'

# Stop the insanity
module Paperclip
  class StringioAdapter
    def cache_current_values
      self.original_filename = 'a_file'
      @size = @target.size
    end

    def fingerprint
      'fiiinnnnngggeeertiiiiiiiipppssss'
    end

    def read
      content = @target.read
      @target.rewind
      content
    end
  end
end


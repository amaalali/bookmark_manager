require './app/models/link'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  # config.shared_context_metadata_behavior = :apply_to_host_groups

  # if config.files_to_run.one?
  #   config.default_formatter = 'doc'
  # end
=begin
  #     --seed 1234
  config.order = :random
  Kernel.srand config.seed
=end
end

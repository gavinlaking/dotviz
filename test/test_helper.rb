unless ENV['NO_SIMPLECOV']
  require 'simplecov'
  require 'simplecov-console' if ENV['CONSOLE_COVERAGE']
end

require 'pry'
require 'minitest/autorun'
require 'minitest/pride' unless ENV['NO_COLOR']
require 'minitest/hell'

unless ENV['NO_SIMPLECOV']
  SimpleCov.start do
    formatter SimpleCov::Formatter::Console if ENV['CONSOLE_COVERAGE']
    command_name 'MiniTest::Spec'
    add_filter '/test/'
  end
end

module DotvizMiniTestPlugin
  # def before_setup
  #   super
  # end

  # def after_setup
  #   super
  # end

  # def before_teardown
  #   super
  # end

  # def after_teardown
  #   super
  # end
end # DotvizMiniTestPlugin

module MiniTest

  class Spec

    # parallelize_me! # uncomment to unleash hell
    # i_suck_and_my_tests_are_order_dependent! # just incase

    include DotvizMiniTestPlugin

    class << self

      alias_method :context, :describe

    end # Eigenclass

  end # Spec

end # MiniTest

require 'mocha/setup'
require 'dotviz'

require 'minitest/reporters'
require 'minitest/reporters/mean_time_reporter'
Minitest::Reporters.use!(
  Minitest::Reporters::MeanTimeReporter.new({
    previous_runs_filename: "/tmp/durations",
    report_filename:        "/tmp/durations_results"})
)

ENV["RAILS_ENV"] = "test"
$LOAD_PATH << File.dirname(__FILE__) + "/../vendor/dust-0.1.6/lib"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'dust'

class Test::Unit::TestCase

  def class_for(mod)
    Class.new { include mod.to_s.classify.constantize }
  end

  def assert_true(actual)
    assert_equal true, actual
  end

  def assert_non_true(actual)
    assert_true !actual
  end

  def assert_false(actual)
    assert_equal false, actual
  end

  def assert_non_false(actual)
    assert_false !actual
  end

end


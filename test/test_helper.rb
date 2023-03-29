# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'simplecov'
SimpleCov.start

def read_fixture_file(filename)
  File.read(File.join('test', 'fixture', filename))
end

# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'test_helper'

User = Struct.new(:name, :job, :gender, keyword_init: true)

# тесты для HexletCode
class HexletCodeTest < Minitest::Test
  # Проверяем, что у HexletCode есть версия
  def test_that_it_has_a_version
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @user = User.new(name: 'Rob', job: 'hexlet')
  end

  def test_form_for_with_url
    actual = HexletCode.form_for(User.new, url: '/users') {} # test empty block
    expected = read_fixture_file('form_for_with_url.html')
    assert_equal expected.strip, actual.strip
  end

  def test_form_for_with_custom_method
    actual = HexletCode.form_for(User.new, url: '#', method: :put) {} # test empty block
    expected = read_fixture_file('form_for_with_custom_method.html')
    assert_equal expected.strip, actual.strip
  end

  def test_form_for_without_block
    actual = HexletCode.form_for(User.new, url: '#') {} # test empty block
    expected = read_fixture_file('form_for_without_block.html')
    assert_equal expected.strip, actual.strip
  end

  def test_form_for_with_fields_and_overridden_values
    actual = HexletCode.form_for(@user, url: '#') do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    expected = read_fixture_file('form_for_with_fields_and_overridden_values.html')
    assert_equal expected.strip, actual.strip
  end
end

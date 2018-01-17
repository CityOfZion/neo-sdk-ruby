# frozen_string_literal: true

require 'test_helper'

class Neo::ByteArrayTest < Minitest::Test
  def test_intialize_from_array
    ba = Neo::ByteArray.new [255]
    assert_equal 255.chr(Encoding::ASCII_8BIT), ba.data
  end

  def test_intialize_from_string
    ba = Neo::ByteArray.new "\xff"
    assert_equal 255.chr(Encoding::ASCII_8BIT), ba.data
  end

  def test_serialize_hex_string
    ba = Neo::ByteArray.new [255]
    assert_equal 'ff', ba.to_hex_string
  end

  def test_serialize_hex_string_with_prefix
    ba = Neo::ByteArray.new [255]
    assert_equal '0xff', ba.to_hex_string(prefix: true)
  end

  def test_deserialize_hex_string
    ba = Neo::ByteArray.from_hex_string 'ff'
    assert_equal ba, Neo::ByteArray.new([255])
  end

  def test_convert_to_string
    ba = Neo::ByteArray.new 'Hello!'
    assert_equal 'Hello!', ba.to_string
  end

  def test_convert_from_string
    ba = Neo::ByteArray.from_string 'Hello!'
    assert_equal 'Hello!', ba.to_string
  end

  def test_convert_to_array_of_integer_bytes
    ba = Neo::ByteArray.new 'Hello!'
    assert_equal [72, 101, 108, 108, 111, 33], ba.bytes
  end

  def test_get_value
    ba = Neo::ByteArray.new "\xff"
    assert_equal 255, ba[0]
  end

  def test_set_value
    ba = Neo::ByteArray.new "\xff"
    ba[0] = 42
    assert_equal 42, ba[0]
  end

  def test_to_uint16
    ba = Neo::ByteArray.new [92, 128]
    assert_equal 32_860, ba.to_uint16
  end

  def test_to_s
    ba = Neo::ByteArray.new [255, 6]
    assert_equal '[ff 06]', ba.to_s
  end
end

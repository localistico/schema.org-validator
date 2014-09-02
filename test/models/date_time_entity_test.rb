# Encoding: utf-8
require 'test_helper'

# DateTimeEntity Test
class DateTimeEntityTest < ActiveSupport::TestCase
  # Real datetime test (local)
  test 'real_datetime_local' do
    currency = DateTimeEntity.new(value: '2007-11-03T13:18:05')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (UTC)
  test 'real_datetime_utc' do
    currency = DateTimeEntity.new(value: '2007-11-03T16:18:05Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (relative)
  test 'real_datetime_relative' do
    currency = DateTimeEntity.new(value: '2007-11-03T13:18:05-03:00')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (local and together)
  test 'real_datetime_local_together' do
    currency = DateTimeEntity.new(value: '20071103T131805')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (UTC and together)
  test 'real_datetime_utc_together' do
    currency = DateTimeEntity.new(value: '20071103T161805Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (relative and together)
  test 'real_datetime_relative_together' do
    currency = DateTimeEntity.new(value: '20071103T131805-0300')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (ordinal, local)
  test 'real_datetime_local_ord' do
    currency = DateTimeEntity.new(value: '2007-307T13:18:05')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (ordinal, UTC)
  test 'real_datetime_utc_ord' do
    currency = DateTimeEntity.new(value: '2007-307T16:18:05Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (ordinal, relative)
  test 'real_datetime_relative_ord' do
    currency = DateTimeEntity.new(value: '2007-307T13:18:05-03')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (ordinal, local, together)
  test 'real_datetime_local_ord_together' do
    currency = DateTimeEntity.new(value: '2007307T131805')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (ordinal, UTC, together)
  test 'real_datetime_utc_ord_together' do
    currency = DateTimeEntity.new(value: '2007307T161805Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (ordinal, relative, together)
  test 'real_datetime_relative_ord_together' do
    currency = DateTimeEntity.new(value: '2007307T131805-03')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (weekly, local)
  test 'real_datetime_local_w' do
    currency = DateTimeEntity.new(value: '2007-W44-6T13:18:05')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (weekly, utc)
  test 'real_datetime_utc_w' do
    currency = DateTimeEntity.new(value: '2007-W44-6T16:18:05Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (weekly, relative)
  test 'real_datetime_relative_w' do
    currency = DateTimeEntity.new(value: '2007-W44-6T13:18:05-03:00')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (weekly, local, together)
  test 'real_datetime_local_w_together' do
    currency = DateTimeEntity.new(value: '2007W446T131805')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (weekly, utc, together)
  test 'real_datetime_utc_w_together' do
    currency = DateTimeEntity.new(value: '2007W446T161805Z')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
  # Real datetime test (weekly, relative, together)
  test 'real_datetime_relative_w_together' do
    currency = DateTimeEntity.new(value: '2007W446T131805-0300')
    currency.valid?
    assert_equal Hash.new, currency.errors.messages
  end
end

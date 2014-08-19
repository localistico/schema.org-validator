# Encoding: utf-8
require 'yaml'
require 'test_helper'

# HtmlParser Test
class HtmlParserTest < ActiveSupport::TestCase
  # MICRODATA TESTS
  # LocalBusiness test
  test 'LocalBusiness' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser.hash.keys[0], 'http://schema.org/LocalBusiness'
  end
  # Name test
  test 'name' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/LocalBusiness']['name'],
                 'Beachwalk Beachwear & Giftware'
  end
  # Description test
  test 'description' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    description = parser['http://schema.org/LocalBusiness']['description']
    assert_equal description, 'A superb collection of fine gifts and ' \
                              'clothing to accent your stay in Mexico Beach.'
  end
  # Address test
  test 'address' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address.keys[0], 'http://schema.org/PostalAddress'
  end
  # streetAddress test
  test 'streetAddress' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address['http://schema.org/PostalAddress']['streetAddress'],
                 '3102 Highway 98'
  end
  # addressLocality test
  test 'addressLocality' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressLocality'],
                 'Mexico Beach'
  end
  # addressRegion test
  test 'addressRegion' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressRegion'],
                 'FL'
  end
  # telephone test
  test 'telephone' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/LocalBusiness']['telephone'],
                 '850-648-4200'
  end
  # Restaurant test
  test 'Restaurant' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser.hash.keys[1], 'http://schema.org/Restaurant'
  end
  # Name test
  test 'nameRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['name'], 'GreatFood'
  end
  # Aggregate rating test
  test 'aggregateRating' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    rating = parser['http://schema.org/Restaurant']['aggregateRating']
    assert_equal rating.keys[0], 'http://schema.org/AggregateRating'
  end
  # ratingValue test
  test 'ratingValue' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    rating = parser['http://schema.org/Restaurant']['aggregateRating']
    assert_equal rating['http://schema.org/AggregateRating']['ratingValue'], '4'
  end
  # reviewCount test
  test 'reviewCount' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    rating = parser['http://schema.org/Restaurant']['aggregateRating']
    assert_equal rating['http://schema.org/AggregateRating']['reviewCount'],
                 '250'
  end
  # Address rest test
  test 'addressRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['address'].keys[0],
                 'http://schema.org/PostalAddress'
  end
  # streetAddress rest test
  test 'streetAddressRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['streetAddress'],
                 '1901 Lemur Ave'
  end
  # addressLocality rest test
  test 'addressLocalityRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressLocality'],
                 'Sunnyvale'
  end
  # addressRegion rest test
  test 'addressRegionRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressRegion'],
                 'CA'
  end
  # postalCode rest test
  test 'postalCodeRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['postalCode'],
                 '94086'
  end
  # Telephone rest test
  test 'telephoneRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['telephone'],
                 '(408) 714-1489'
  end
  # url rest test
  test 'urlRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['url'],
                 'www.greatfood.com'
  end
  # openingHours rest test
  test 'openingHoursRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['openingHours'],
                 ['Mo-Sa 11:00-14:30', 'Mo-Th 17:00-21:30', 'Fr-Sa 17:00-22:00']
  end
  # servesCuisine rest test
  test 'servesCuisineRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['servesCuisine'],
                 ['Middle Eastern', 'Mediterranean']
  end
  # priceRange rest test
  test 'priceRangeRest' do
    parser = HtmlParser.new('test/fixtures/webpage_demo.html')
    assert_equal parser['http://schema.org/Restaurant']['priceRange'], '$$'
  end
  # ----------------------------------------------------------------
  # RDFa TESTS
  # LocalBusiness test
  test 'LocalBusinessRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser.hash.keys[0], 'http://schema.org/LocalBusiness'
  end
  # Name test
  test 'nameRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/LocalBusiness']['name'],
                 'Beachwalk Beachwear & Giftware'
  end
  # Description test
  test 'descriptionRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    description = parser['http://schema.org/LocalBusiness']['description']
    assert_equal description, 'A superb collection of fine gifts and ' \
                              'clothing to accent your stay in Mexico Beach.'
  end
  # Address test
  test 'addressRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address.keys[0], 'http://schema.org/PostalAddress'
  end
  # streetAddress test
  test 'streetAddressRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address['http://schema.org/PostalAddress']['streetAddress'],
                 '3102 Highway 98'
  end
  # addressLocality test
  test 'addressLocalityRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressLocality'],
                 'Mexico Beach'
  end
  # addressRegion test
  test 'addressRegionRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/LocalBusiness']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressRegion'],
                 'FL'
  end
  # telephone test
  test 'telephoneRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/LocalBusiness']['telephone'],
                 '850-648-4200'
  end
  # Restaurant test
  test 'RestaurantRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser.hash.keys[1], 'http://schema.org/Restaurant'
  end
  # Name test
  test 'nameRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['name'], 'GreatFood'
  end
  # Aggregate rating test
  test 'aggregateRatingRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    rating = parser['http://schema.org/Restaurant']['aggregateRating']
    assert_equal rating.keys[0], 'http://schema.org/AggregateRating'
  end
  # ratingValue test
  test 'ratingValueRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    rating = parser['http://schema.org/Restaurant']['aggregateRating']
    assert_equal rating['http://schema.org/AggregateRating']['ratingValue'], '4'
  end
  # reviewCount test
  test 'reviewCountRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    rating = parser['http://schema.org/Restaurant']['aggregateRating']
    assert_equal rating['http://schema.org/AggregateRating']['reviewCount'],
                 '250'
  end
  # Address rest test
  test 'addressRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['address'].keys[0],
                 'http://schema.org/PostalAddress'
  end
  # streetAddress rest test
  test 'streetAddressRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['streetAddress'],
                 '1901 Lemur Ave'
  end
  # addressLocality rest test
  test 'addressLocalityRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressLocality'],
                 'Sunnyvale'
  end
  # addressRegion rest test
  test 'addressRegionRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['addressRegion'],
                 'CA'
  end
  # postalCode rest test
  test 'postalCodeRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    address = parser['http://schema.org/Restaurant']['address']
    assert_equal address['http://schema.org/PostalAddress']['postalCode'],
                 '94086'
  end
  # Telephone rest test
  test 'telephoneRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['telephone'],
                 '(408) 714-1489'
  end
  # url rest test
  test 'urlRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['url'],
                 'www.greatfood.com'
  end
  # openingHours rest test
  test 'openingHoursRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['openingHours'],
                 ['Mo-Sa 11:00-14:30', 'Mo-Th 17:00-21:30', 'Fr-Sa 17:00-22:00']
  end
  # servesCuisine rest test
  test 'servesCuisineRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['servesCuisine'],
                 ['Middle Eastern', 'Mediterranean']
  end
  # priceRange rest test
  test 'priceRangeRestRDFa' do
    parser = HtmlParser.new('test/fixtures/webpage_rdfa.html')
    assert_equal parser['http://schema.org/Restaurant']['priceRange'], '$$'
  end
end

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

# this method is a key method and will always 
#run with the test run and than move to next test
def setup
  #all new data creation will be in test data env and will be cleaned after
  #the test. Dev env will not be effected by this change.
  @category = Category.new(name: "sports")
end

test "category should be valid" do 
  assert @category.valid?
end

test "name should be present" do
  @category.name = ''
  #Assert_not should be used to teat negactive scenarios
  assert_not @category.valid?
end

test "name should be unique" do
  @category.save
  @category = Category.new(name: "sports")
  assert_not @category.valid?
end

test "name should not be too large" do
  @category.name = 'a'*26
  assert_not @category.valid?
end

test "name should not be to small" do
  @category.name = 'aa'
  assert_not @category.valid?
end

end

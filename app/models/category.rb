class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false },
            length: {minimum:3, maximum: 25}
  # or for uniq , below code can be used
  # validates_uniqueness_of :name
end
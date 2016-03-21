class Category < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 35, minimum: 3 }
  validates_uniqueness_of :name
end
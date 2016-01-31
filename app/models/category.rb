class Category < ActiveRecord::Base
  belongs_to :broadcast
  has_many :items
end

class Item < ActiveRecord::Base

  belongs_to :category
  has_one :content

  validates_presence_of :category_id

  def data content
    content.merge({type: self.type})
  end

end

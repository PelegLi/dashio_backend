class Item < ActiveRecord::Base

  belongs_to :category
  has_one :content

  validates_presence_of :category_id

  def data
    raise NotImplementedError, "#{self.class.name} does not implement data()"
  end

end

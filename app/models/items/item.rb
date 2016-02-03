class Item < ActiveRecord::Base

  belongs_to :category
  has_one :content

  validates_presence_of :category_id

  def data content
    content.merge({type: type})
  end

  def as_json options={}
    super.merge({type: type})
  end

end

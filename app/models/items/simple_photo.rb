class SimplePhoto < Item

  def data
    {description: self.content.description, path: path_to_picture}
  end

  alias_method :path, :data


  private

  def path_to_picture
    "#{Rails.root}/uploads/pictures/#{self.content.data}"
  end

end
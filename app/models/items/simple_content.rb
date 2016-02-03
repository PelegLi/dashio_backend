class SimpleContent < Item

  def data
    self.content.as_json(only: [:description, :data])
  end

end
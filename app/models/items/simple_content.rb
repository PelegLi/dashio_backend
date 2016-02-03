class SimpleContent < Item

  def data
    super(self.content.as_json(only: [:description, :data]))
  end

end
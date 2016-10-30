class User
  def initialize(inner_attributes)
    @inner_attributes = inner_attributes
  end

  def icon_url
    @inner_attributes['image']
  end

  def name
    @inner_attributes['user']
  end

  def full_name
    @inner_attributes['first_name'] + @inner_attributes['last_name']
  end
end

class User
  def initialize(inner_attributes)
    @inner_attributes = inner_attributes
  end

  def icon_url
    @inner_attributes['image']
  end

  def name
    @inner_attributes['name']
  end

  def email
    @inner_attributes['email']
  end

  def identifier
    "#{name} (#{email})"
  end
end

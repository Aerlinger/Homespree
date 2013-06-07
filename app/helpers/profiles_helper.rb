module ProfilesHelper
  def string_to_id(name)
    name.gsub(/ +|\//, {' ' => '_', '/' => ''}).downcase
  end
end

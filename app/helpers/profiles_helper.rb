module ProfilesHelper
  def string_to_id(name)
    name.gsub(/ +|\//, {' ' => '_', '/' => ''}).downcase
  end

  def default_description
    %Q[
      Finding a trustworthy contractor at a reasonable price is usually quite a challenge. However,
      Homespree lets you quickly upload project requests online or from your mobile device and receive
      competitive estimates from quality local pros.
    ]
  end
end

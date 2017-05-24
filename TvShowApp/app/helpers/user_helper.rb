module UserHelper

  def full_name (user)
    if not user.first_name.nil? and not user.last_name.nil?
      user.first_name + " " + user.last_name
    else
      "None"
    end
  end

  def age
    time = Time.now.strftime("%Y-%m-%d")
  end

end

module UserHelper

  def full_name (user)
    if not user.first_name.nil? and not user.last_name.nil?
      user.first_name + " " + user.last_name
    else
      "None"
    end
  end

  def age (user)
    if not user.birthday.nil?
      time = Time.now.strftime("%Y-%m-%d")
      user_time = user.birthday.to_s
      lista_tiempo_actual = time.split("-").map{ |s| s.to_i }
      lista_tiempo_user = user_time.split('-').map{ |s| s.to_i }
      if lista_tiempo_user[1] < lista_tiempo_actual[1]
        edad_basal = lista_tiempo_actual[0] - lista_tiempo_user[0]
      elsif lista_tiempo_user[1] == lista_tiempo_actual[1] and lista_tiempo_user[2] <= lista_tiempo_actual[2]
        edad_basal = lista_tiempo_actual[0] - lista_tiempo_user[0]
      else
        edad_basal = lista_tiempo_actual[0] - lista_tiempo_user[0] - 1
      end
    else
      "None"
    end
  end

  def new_mail
    email = current_user.email + "1"
    bol = true
    while bol == true do
      busqueda = User.find_by(:email => email)
      if busqueda.nil?
        bol = false
      else
        email = email + "1"
      end
    end
    email

  end

end

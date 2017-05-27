module ApplicationHelper

  def root_path?
    request.path == "/tv_shows" ? true : false
  end
end

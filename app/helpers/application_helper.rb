module ApplicationHelper
  def is_active_path(path='')
    current_page?(path) ? 'active' : ''
  end
end

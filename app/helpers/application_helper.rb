module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', warning: 'alert-warning',
      notice: 'alert-info' }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      msg_type += '-info' if msg_type == 'alert'
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show m-2",
                                        role: 'alert') do
               concat content_tag(:button, '', class: 'btn-close', data: { bs_dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end
end

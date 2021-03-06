module ApplicationHelper

def markdown(text)
 options = {
   filter_html:     true,
   hard_wrap:       true,
   link_attributes: { rel: 'nofollow', target: "_blank" },
   space_after_headers: true,
   fenced_code_blocks: true
 }

 extensions = {
   autolink:           true,
   superscript:        true,
   disable_indented_code_blocks: true
 }

 renderer = Redcarpet::Render::HTML.new(options)
 markdown = Redcarpet::Markdown.new(renderer, extensions)

 markdown.render(text).html_safe
end

def bootstrap_class_for flash_type
  { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
end

def flash_messages(opts = {})
  flash.each do |msg_type, message|
    concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
            concat content_tag(:button, '✖', class: "close", data: { dismiss: :success })
            concat message
          end)
  end
  nil
end

end

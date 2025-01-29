module ApplicationHelper
  def link_to_add_fields(name, f, association, html_options = {})
    new_object = f.object.send(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render("#{association.to_s.singularize}_fields", f: builder)
    end
    html_options[:data] ||= {}
    html_options[:data][:association] = association
    html_options[:data][:fields] = fields.gsub("\n", "")
    link_to(name, "#", html_options.merge(class: "add_fields"))
  end

  def link_to_remove_fields(name, f, html_options = {})
    f.hidden_field(:_destroy) + link_to(name, "#", html_options.merge(class: "remove_fields"))
  end
end

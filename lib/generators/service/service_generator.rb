class ServiceGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  argument :namespace, type: :string
  argument :object, type: :string
  argument :action_name, type: :string

  def create_service
    template 'service.rb.erb', "app/services/#{namespace.underscore}/#{object.tableize}/#{action_name.underscore}.rb"
  end
end

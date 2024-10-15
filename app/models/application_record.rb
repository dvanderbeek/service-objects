class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def method_missing(name, *args, **kwargs, &block)
    service = "#{self.class.name.tableize.camelize}::#{name.to_s.classify}".safe_constantize
    return super unless service
    service.call(object: self)
  end
end

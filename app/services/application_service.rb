class ApplicationService
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization

  attribute :object

  def self.call(attrs = {})
    service = new(attrs)
    service.validate!
    service.call
  end
end

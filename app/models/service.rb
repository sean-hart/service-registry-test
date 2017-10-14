class Service < ApplicationRecord
  # validations
  validates_presence_of :service_name, :owner, :description, :language
end

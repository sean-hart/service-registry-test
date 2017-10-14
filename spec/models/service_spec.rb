require 'rails_helper'

RSpec.describe Service, type: :model do
  # ensure defined fields are present before saving
  it { should validate_presence_of(:service_name) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:language) }
end

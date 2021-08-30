require 'rails_helper'

RSpec.describe Todo, type: :model do
  #1:m relationship test 
  it { should have_many(:items).dependent(:destroy) }
  # check if title and created_by are present 
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:created_by)}
end

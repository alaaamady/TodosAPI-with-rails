require 'rails_helper'

RSpec.describe Item, type: :model do
  #giving it its check for the m:1 relationship
  it {should belong_to(:todo)}
  #check if name is present 
  it {should validate_presence_of(:name)}

end

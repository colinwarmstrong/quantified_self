require 'rails_helper'

describe Food, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end
end

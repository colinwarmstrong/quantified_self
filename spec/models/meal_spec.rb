require 'rails_helper'

describe Meal, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should have_many :foods }
  end
end

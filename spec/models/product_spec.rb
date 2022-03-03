RSpec.describe Product, type: :model do
  describe 'Database' do
    it {
      is_expected.to have_db_column(:name)
        .of_type(:string)
    }
    it {
      is_expected.to have_db_column(:price)
        .of_type(:float)
    }
    it {
      is_expected.to have_db_column(:description)
        .of_type(:text)
    }
  end
  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:product)).to be_valid
    end
  end
end

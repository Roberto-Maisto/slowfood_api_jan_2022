RSpec.describe Order, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:user_id) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items) }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:order)).to be_valid
    end
  end
end

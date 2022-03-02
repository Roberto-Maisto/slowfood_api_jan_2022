RSpec.describe OrderItem, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:order_id) }
    it { is_expected.to have_db_column(:product_id) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:order_item)).to be_valid
    end
  end
end

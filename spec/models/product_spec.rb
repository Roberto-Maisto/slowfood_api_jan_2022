RSpec.describe Product, type: :model do
  describe 'Database' do
    it { is expected.to have_db_column(:name).of_type(:string) }
    it { is expected.to have_db_column(:price).of_type(:float) }
   
  end

  describe 'Factory' do
  end
end

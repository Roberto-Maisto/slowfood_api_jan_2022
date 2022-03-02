RSpec.describe Product, type: :model do
  describe 'Database' do
it { is_expected.to have_db_coloumn(:name).of_type(:string)}
end
describe 'Factory' do
end

end

RSpec.describe 'PUT /api/orders', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:order) { create(:order, user: user) }
  let(:product_1) { create(:product) }
  let(:product_2) { create(:product) }

  subject { response }
  before do
    order.items.create(product: product_1)
    put "/api/orders/#{order.id}",
        params: { product_id: product_2.id },
        headers: credentials
  end

  it { is_expected.to have_http_status 200 }

  it 'is expected to respond with a message' do
    expect(response_json['message']).to eq 'Your order was updated...'
  end
end

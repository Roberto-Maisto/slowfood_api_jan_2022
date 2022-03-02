RSpec.describe 'POST /api/orders', type: :request do
  let(:product) { create(:product) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_auth_token }
  before do
    post '/api/orders',
         params: {
           product_id: product.id
         },
         headers: credentials

    @order = Order.last
  end

  subject { response }

  it { is_expected.to have_http_status 201 }

  it 'is expected to responde with a message' do
    expect(response_json['message']).to eq 'Your order was created...'
  end

  it 'is expected to associate the order with the user' do
    expect(@order.user).to eq user
  end

  it 'is expected to associate the product with the order' do
    expect(@order.items.first.product).to eq product
  end
end

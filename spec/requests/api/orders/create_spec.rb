RSpec.describe 'POST /api/orders', type: :request do
  let(:product) { create(:product) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  subject { response }

  describe 'with valid params and headers' do
    before do
      post '/api/orders',
           params: {
             product_id: product.id
           },
           headers: credentials

      @order = Order.last
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to respond with a message' do
      expect(response_json['message']).to eq 'Your order was created...'
    end

    it 'is expected to respond with order details' do
      expect(response_json['order']).not_to be nil
    end

    it 'is expected to associate the order with the user' do
      expect(@order.user).to eq user
    end

    it 'is expected to associate the product with the order' do
      expect(@order.items.first.product).to eq product
    end
  end

  describe 'without valid parameters' do
    before do
      post '/api/orders', params: { product_id: nil }, headers: credentials
    end

    it { is_expected.to have_http_status 422 }

    it 'is expected to respond with an error' do
      expect(response_json['error']).to eq 'Your request could not be processed...'
    end
  end

  describe 'without valid authentication credentials in headers' do
    before do
      post '/api/orders', params: { product_id: product.id }, headers: nil
    end

    it { is_expected.to have_http_status 401 }

    it 'is expected to respond with an error' do
      expect(response_json['errors']).to include 'You need to sign in or sign up before continuing.'
    end
  end
end

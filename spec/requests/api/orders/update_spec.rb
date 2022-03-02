RSpec.describe 'PUT /api/orders', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:order) { create(:order, user: user) }
  let(:product_1) { create(:product) }
  let(:product_2) { create(:product) }

  subject { response }

  describe 'with valid parameters and credentials' do
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

  describe 'without valid parameters' do
    before do
      order.items.create(product: product_1)
      put "/api/orders/#{order.id}",
          params: { product_id: nil },
          headers: credentials
    end

    it { is_expected.to have_http_status 422 }

    it 'is expected to respond with an error' do
      expect(response_json['error']).to eq 'Your request could not be processed...'
    end
  end

  describe 'without valid credentials' do
    before do
      order.items.create(product: product_1)
      put "/api/orders/#{order.id}",
          params: { product_id: product_2.id },
          headers: nil
    end

    it { is_expected.to have_http_status 401 }

    it 'is expected to respond with an error' do
      expect(response_json['errors']).to include 'You need to sign in or sign up before continuing.'
    end
  end

  describe 'without an order in the database' do
    before do
      put "/api/orders/999",
          params: { product_id: product_2.id },
          headers: credentials
    end

    it { is_expected.to have_http_status 422 }

    it 'is expected to respond with an error' do
      expect(response_json['error']).to eq 'Your request could not be processed...'
    end
    
  end
  
end

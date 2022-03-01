RSpec.describe 'GET /api/products', typer: :request do
  let!(:product) { create_list(:product, 3) }
  describe 'successfully'
  before do
    get '/api/products'
  end

  subject { response }

  it 'is expected ro respond with status code 200' do
    expect(subject.status).to eq 200
  end
  it 'is expected to return a list of products' do
    expect(response_json['products'].size).to eq 3
  end
end

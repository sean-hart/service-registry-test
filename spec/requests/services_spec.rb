require 'rails_helper'

RSpec.describe 'Services API', type: :request do
  # Initialize test data
  let!(:services) { create_list(:service, 10) }
  let(:service_id) { services.first.id }

  # Test suite for GET /services
  describe 'GET /services' do
    before { get '/services' }

    it 'returns services' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /services/:id
  describe 'GET /services/:id' do
    before { get "/services/#{service_id}" }

    context 'when the record exists' do
      it 'returns the service' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(service_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:service_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Service/)
      end
    end
  end

  # Test suite for POST /services
  describe 'POST /services' do
    # valid payload
    let(:valid_attributes) { { service_name: 'Hollowchronic', owner: 'Don Juan Demarco', description: 'Takes off the edge, but seems a bit empty.', language: 'Ruby' } }

    context 'when the request is valid' do
      before { post '/services', params: valid_attributes }

      it 'creates a service' do
        expect(json['service_name']).to eq('Hollowchronic')
        expect(json['owner']).to eq('Don Juan Demarco')
        expect(json['description']).to eq('Takes off the edge, but seems a bit empty.')
        expect(json['language']).to eq('Ruby')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/services', params: { service_name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Owner can't be blank, Description can't be blank, Language can't be blank/)
      end
    end
  end

  # Test suite for PUT /services/:id
  describe 'PUT /services/:id' do
    let(:valid_attributes) { { service_name: 'TooWongFoo', owner: 'Julie Newmar', description: 'Thanks for everything', language: 'Groovy' } }

    context 'when the record exists' do
      before { put "/services/#{service_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /services/:id
  describe 'DELETE /services/:id' do
    before { delete "/services/#{service_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

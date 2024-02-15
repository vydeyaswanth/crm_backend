require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:valid_attributes) do
    { name: 'John Doe', email: 'john@example.com' }
  end

  let(:invalid_attributes) do
    { name: '', email: '' }
  end

  let(:customer) { create(:customer) }

  describe 'GET #index' do
    it 'returns a success response' do
      customer
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns the customer' do
      get :show, params: { id: customer.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'does not create a new Customer' do
        expect do
          post :create, params: { customer: invalid_attributes }
        end.not_to change(Customer, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with invalid params' do
      it 'does not update the Customer' do
        put :update, params: { id: customer.id, customer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested customer' do
      customer
      expect do
        delete :destroy, params: { id: customer.id }
      end.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end

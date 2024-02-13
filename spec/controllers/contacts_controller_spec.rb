require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:customer) { create(:customer) }
  let(:contact) { create(:contact, customer: customer) }
  let(:invalid_attributes) do
    { name: '', email: '', phone: '' }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { customer_id: customer.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns the contact' do
      get :show, params: { customer_id: customer.id, id: contact.id }
      expect(response).to be_successful
      expect(json_response['id']).to eq(contact.id)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) do
        { name: 'John Doe', email: 'john@example.com', phone: '1234567890' }
      end

      context 'with invalid params' do
        let(:invalid_attributes) { { name: '', email: '', phone: '' } }

        it 'does not create a new Contact and returns a failure response' do
          expect do
            post :create, params: { customer_id: customer.id, contact: invalid_attributes }
          end.not_to change(Contact, :count)

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      { name: 'Jane Doe', email: 'jane@example.com', phone: '9876543210' }
    end

    context 'with valid params' do
      it 'updates the requested contact' do
        put :update, params: { customer_id: customer.id, id: contact.id, contact: new_attributes }
        contact.reload
        expect(contact.name).to eq('Jane Doe')
        # Add more expectations for the updated attributes here
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested contact' do
      contact # Create the contact
      expect do
        delete :destroy, params: { customer_id: customer.id, id: contact.id }
      end.to change(Contact, :count).by(-1)
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end

  def valid_attributes
    # Add valid attributes for Contact creation
  end

  def invalid_attributes
    # Add invalid attributes for Contact creation
  end

  def new_attributes
    # Add new attributes for Contact update
  end
end

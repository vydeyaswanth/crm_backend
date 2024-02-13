require 'rails_helper'

RSpec.describe InteractionsController, type: :controller do
  let(:customer) { create(:customer) }
  let(:interaction) { create(:interaction, customer: customer) }
  let(:valid_attributes) do
    { title: 'New Meeting', details: 'Discussion about project', date: '2022-01-01' }
  end
  let(:invalid_attributes) do
    { title: '', details: '', date: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      interaction
      get :index, params: { customer_id: customer.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns the interaction' do
      get :show, params: { customer_id: customer.id, id: interaction.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Interaction' do
        expect do
          post :create, params: { customer_id: customer.id, interaction: valid_attributes }
        end.to change(Interaction, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Interaction' do
        expect do
          post :create, params: { customer_id: customer.id, interaction: invalid_attributes }
        end.not_to change(Interaction, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      { title: 'Updated Meeting', details: 'Extended discussion', date: '2022-01-02' }
    end

    context 'with valid params' do
      it 'updates the requested interaction' do
        put :update, params: { customer_id: customer.id, id: interaction.id, interaction: new_attributes }
        interaction.reload
        expect(interaction.title).to eq('Updated Meeting')
        expect(response).to be_successful
      end
    end

    context 'with invalid params' do
      it 'does not update the Interaction' do
        put :update, params: { customer_id: customer.id, id: interaction.id, interaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested interaction' do
      interaction # Create the interaction
      expect do
        delete :destroy, params: { customer_id: customer.id, id: interaction.id }
      end.to change(Interaction, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end

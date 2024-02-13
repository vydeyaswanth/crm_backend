class ContactsController < ApplicationController
  before_action :set_customer
  before_action :set_contact, only: %i[show update destroy]

  # GET /customers/:customer_id/contacts
  def index
    @contacts = @customer.contacts
    render json: @contacts
  end

  # GET /customers/:customer_id/contacts/:id
  def show
    render json: @contact
  end

  # POST /customers/:customer_id/contacts
  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = params[:customer_id]

    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/:customer_id/contacts/:id
  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/:customer_id/contacts/:id
  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def set_customer
    @customer = Customer.find_by(id: params[:customer_id])
    render json: { error: 'Customer not found' }, status: :not_found unless @customer
  end

  def set_contact
    @contact = @customer.contacts.find_by(id: params[:id])
    render json: { error: 'Contact not found' }, status: :not_found unless @contact
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone)
  end
end

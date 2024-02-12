class InteractionsController < ApplicationController
  before_action :set_customer
  before_action :set_interaction, only: %i[show update destroy]

  # GET /customers/:customer_id/interactions
  def index
    @interactions = @customer.interactions
    render json: @interactions
  end

  # GET /customers/:customer_id/interactions/:id
  def show
    render json: @interaction
  end

  # POST /customers/:customer_id/interactions
  def create
    @interaction = @customer.interactions.new(interaction_params)
    if @interaction.save
      render json: @interaction, status: :created
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/:customer_id/interactions/:id
  def update
    if @interaction.update(interaction_params)
      render json: @interaction
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/:customer_id/interactions/:id
  def destroy
    @interaction.destroy
    head :no_content
  end

  private

  def set_customer
    @customer = Customer.find_by(id: params[:customer_id])
    render json: { error: 'Customer not found' }, status: :not_found unless @customer
  end

  def set_interaction
    @interaction = @customer.interactions.find_by(id: params[:id])
    render json: { error: 'Interaction not found' }, status: :not_found unless @interaction
  end

  def interaction_params
    params.require(:interaction).permit(:title, :details, :date)
  end
end

class QuotationsController < ApplicationController
  before_action :get_quotation, only: [:show, :edit, :update, :destroy]
  
  def get_quotation
    @quotation = Quotation.find(params[:id])
  end
  
  def index
    @quotations = Quotation.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @quotation.update_attributes(quotation_params)
      redirect_to quotations_path
    else
      render 'edit'
    end
  end
  
  def new
  	@quotation = Quotation.new
  end
  
  def create
    @quotation = Quotation.new(quotation_params)
    if @quotation.save
      render 'new'
    else
      redirect_to 'error'
    end
  end
  
  def destroy
    @quotation.destroy
    redirect_to quotations_path
  end
  
  private
  def quotation_params
    params.require(:quotation).permit(:client, :email, :phone, :address, :city, :description, :date, :time)
  end
end

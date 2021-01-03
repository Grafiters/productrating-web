class PurchasesController < ApplicationController

  before_action do
    @product = Product.find(params[:product_id])

    case action_name.to_sym
    when :new, :create
      @purchase = @product.purchases.new
    when :show, :edit, :update, :create
      @purchase = @product.purchases.find(params[:id])
      @review = @purchase.review.find_by(params[:purchase_id])
    when :destroy
      @purchase = Purchase.find(params[:id])
    end
  end

  def new
  end

  def create
    # TODO: Also decrease product quantity.
    # - For example, if `purchase.quantity` is 3, decrease `product.quantity` by 3
    # - Display an error if `product.quantity` is less than 0 (negative number)
    # clear
    @purchase.assign_attributes(purchase_params)
    @quantity = @purchase.quantity
    @product.quantity -= @quantity
    if @purchase.save
      if @product.update_attributes(product_params)
        redirect_to product_url(@product) 
      end
    else
      flash[:error] = @purchase.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    # TODO: Show edit form
    # clear
  end

  def update
    # TODO: Update record (save to database)
    # cleat
    if @purchase.update_attributes(purchase_params)
      redirect_to product_url(@product)
    else
      flash[:error] = @purchase.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    # TODO: Delete record
    #clear
    @purchase.destroy
    redirect_to product_ur(@product)
  end

  def show
    # render json: {
      
    # }
  end

  private
    def purchase_params
      params.require(:purchase).permit(:quantity, :delivery_address)
    end

    def product_params
      params.permit(:quantity)
    end
end  

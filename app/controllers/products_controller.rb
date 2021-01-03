class ProductsController < ApplicationController
  
  before_action do
    case action_name.to_sym
    when :new, :create
      @product = Product.new
    when :show, :edit, :update, :destroy
      @product = Product.find(params[:id])
      @purchase = @product.purchases.find_by(params[:id])
      @review = @purchase.review.all
    end
  end

  def new
  end

  def create
    @product.assign_attributes(product_params)
    if @product.save
      redirect_to products_url
    else
      flash[:error] = @product.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @rating = @review.sum('rating')
    @date = @product.created_at.strftime('%F')
  end

  def index
    @products = Product.all
  end

  private
    def product_params
      params.require(:product).permit(:name, :quantity, :price)
    end

end  

class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    params[:product][:price] = params[:product][:price].gsub(",", "")
    product_params = params.require(:product).permit([:title, :price, :description])
    @product = Product.new(product_params)
    if @product.save
      render text: "success"
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    product_params = params.require(:product).permit([:title, :price, :description])
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to product_path(@product)
  end
end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new 
  end

  def index
    @products = Product.all
  end
#DELETE / questions/ :id (e.g./questions/123)
#this is used to delete a question from the database
  def destroy
    @product = Product.find params[:id]
    redirect_to product_path
  end

end

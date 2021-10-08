class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status:200
  end
  def create
    product = Product.new(
      name: prod_params[:name],
      brand: prod_params[:brand],
      price: prod_params[:price],
      description: prod_params[:description]
    )
    if product.save
      render json: product, status: 201
      
    else
      render json: {error: "error while creation"}
    end
  end
  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
      
    else
      render json: {error: "Product not found"}
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    if prod_params[:name]
    product.name= prod_params[:name]
      
    end
    if prod_params[:brand]
      product.brand= prod_params[:brand]
    end
    if prod_params[:price]
      product.price= prod_params[:price]
    end
    if prod_params[:description]
      product.description= prod_params[:description]
    end
    if product.save
      render json: product, status: 201
    else
      render json: {error: "error while updation"}
    end
  end
  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {response: "Product deleted"}
  end

  private
  def prod_params
    params.require(:product).permit([
      :name,
      :brand,
      :price,
      :description
    ])
  end
end

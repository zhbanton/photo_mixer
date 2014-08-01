class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
    @images = @category.images
  end

end

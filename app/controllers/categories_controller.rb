class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @images = @category.images
  end

end

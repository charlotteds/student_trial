class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Success for created"
      redirect_to admin_categories_url
    else
      render 'new'
    end  
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete

    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end
class CategoriesController < ApplicationController
  
  before_action :require_admin, except: [:index, :show]
  
  def index
    @categories = Category.order('created_at ASC').page params[:page]
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "The category has been successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.order('created_at DESC').page params[:page]
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "You must be logged in as an Admin to perform this action"
      redirect_to categories_path
    end
  end
  
end

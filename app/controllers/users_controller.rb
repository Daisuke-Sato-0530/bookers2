class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def new
    @book = Book.new
  end

  def create
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def destroy
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path(current_user), notice: "successfully"
  else
    render :edit
  end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

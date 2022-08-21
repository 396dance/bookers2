class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    # @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    # bookモデルの情報を投稿するための投稿フォーム作成のために空のオブジェクト生成
    @book = Book.new
    @books = @user.books
  end

  def edit
    # userテーブルにあるidが1のレコードを取得とか
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

class UsersController < ApplicationController
  # before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
    @users = User.find(params[:id])
    # @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    # bookモデルの情報を投稿するための投稿フォーム作成のために空のオブジェクト生成
    @book = Book.new
    @books = @user.books
    # @following_users = @user.following_user
    # @follower_users = @user.follower_user
  end

  def edit
    # userテーブルにあるidが1のレコードを取得とか
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success] = "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  # # フォロー一覧画面
  # def follows
  # user = User.find(params[:id])
  # @users = user.following_user.page(params[:page]).per(3).reverse_order
  # end

  # # フォロワー一覧画面
  # def followers
  #   user = User.find(params[:id])
  # @users = user.follower_user.page(params[:page]).per(3).reverse_order
  # end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



end

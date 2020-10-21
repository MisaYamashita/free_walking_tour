class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.tour_id = params[:tour_id] #newのURIにtour_idがあるため、そのparamsのtour_idをインスタンス変数@reviewのtour_idに代入する
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.tour_id = params[:tour_id]
    if @review.save!
     flash[:success] = "レビューを投稿しました"
     redirect_to tour_path(@review.tour_id)
    else
      flash.now[:danger] = "レビューを投稿に失敗しました"
    end 
  end

  def index
    @review = Review.where(tour_id: params[:tour_id]).paginate(page: params[:page], per_page: 5) #tour_idごとの一覧を表示する
   
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      flash[:success] = "レビュー内容をを変更しました"
      redirect_to tour_path(@review.tour.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id]).delete
    redirect_to tour_path(@review.tour.id)
    flash[:info] = 'レビューを削除しました'
  end
  
  private
    def review_params
      params.require(:review).permit(:tour_id, :user_id, :body, :rate)
    end 
end

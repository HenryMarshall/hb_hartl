class MicropostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # this does make your feed empty on failure
      # kinda kludgy
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    # user may only destroy their own posts
    def correct_user
      # #find would raise exception if micropost is not found
      # #find_by returns nil instead
      @micropost = current_user.microposts.find_by id: params[:id]
      redirect_to root_url if @micropost.nil?
    end

end
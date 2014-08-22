class MicropostsController < ApplicationController 
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end  

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
   @micropost.destroy
    redirect_to root_url
  end

  private 

    def micropost_params
      params.require(:micropost).permit(:content)
    end
     def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

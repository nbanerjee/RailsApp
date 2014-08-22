class StaticPagesController < ApplicationController
  def home     
     @micropost = current_user.microposts.build if signed_in?
    if signed_in?
     @feed_items = current_user.microposts.paginate(page: params[:page], per_page: 5)
    end 
  end

  def help
  end

  def about
  end
  
  def contact
  end
end

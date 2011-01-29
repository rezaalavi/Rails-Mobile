class PhotoController < ApplicationController
  def index
   
    @msg="normal " + params[:id]
  end

  def index_mobile
   
    @msg="mobile "+ params[:id]
    render :action => "index"
  end

end

class InfoController < ApplicationController
  def index
    @msg="Normal User"
  end

  def index_mobile
    @msg="mobile"
    render :action => "index"
  end

end

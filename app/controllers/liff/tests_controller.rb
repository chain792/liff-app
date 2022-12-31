class Liff::TestsController < Liff::Base
  def index

  end

  def create
    p 'aa'
    render 'index'
  end
end
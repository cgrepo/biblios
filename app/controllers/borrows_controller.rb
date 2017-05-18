class BorrowsController < ApplicationController
  def index
    @borrows = Borrowed.all.order(:created_at).paginate(page: params[:page], per_page:20)
  end
  
  def new
  end
  
  def get_byName
    @books = Concessionary.where("name LIKE ?",'%'+params[:name]+'%')
    respond_to do |format|
      format.js {}
    end
  end
  
end

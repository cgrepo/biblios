class BorrowsController < ApplicationController
  def index
    @borrows = Borrowed.all.order(:created_at).paginate(page: params[:page], per_page:20)
  end
  
  def new
  end
  
  def getByTitle
    #@books = Book.where("title LIKE ?",'%'+params[:title]+'%')
    #byebug
    respond_to do |format|
      format.html { render :partial=> 'getByTitle'}
      format.js {}
    end
  end
  def getByISBN
    respond_to do |format|
      format.html { render :partial=> 'getByISBN'}
      format.js {}
    end
  end
  def getByAutor
    respond_to do |format|
      format.html { render :partial=> 'getByAutor'}
      format.js {}
    end
  end
  
end

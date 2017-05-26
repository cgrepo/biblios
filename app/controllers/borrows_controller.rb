class BorrowsController < ApplicationController
  def index
    @borrows = Borrowed.all.order(:created_at).paginate(page: params[:page], per_page:20)
  end
  def new
  end
  def getByTitle
    respond_to do |format|
      format.html { render :partial => 'getByTitle'}
    end
  end
  def findByTitle
    @books = Book.where("title LIKE ?",'%'+params[:borrow][:title]+'%')
    respond_to do |format|  
      format.html {render :partial => 'findByTitle'}
    end
  end
  def getByISBN
    respond_to do |format|
      format.html { render :partial=> 'getByISBN'}
    end
  end
  def findByISBN
    @book = Book.find_by(isbn:params[:borrow][:isbn])
    respond_to do |format|  
      format.html {render :partial => 'findByISBN'}
    end
  end
  def getByAutor
    respond_to do |format|
      format.html { render :partial=> 'getByAutor'}
    end
  end
  def findByAutor
    @books = Book.where("autor LIKE ?",'%'+params[:borrow][:autor]+'%')
    respond_to do |format|  
      format.html {render :partial => 'findByAutor'}
    end
  end
  def getByName
    respond_to do |format|
      format.html { render :partial=> 'getByName'}
    end
  end
  def findByName
    @subscriptors = Subscriptor.where("fullname LIKE ?",'%'+params[:borrow][:name]+'%')
    respond_to do |format|  
      format.html {render :partial => 'findSubByName'}
    end
  end
  def getByAcc
    respond_to do |format|
      format.html { render :partial=> 'getSubscriptorAcc'}
    end
  end
  def findByAcc
    @subscriptor = Subscriptor.find_by account:params[:borrow][:account]
    respond_to do |format|  
      format.html {render :partial => 'findSubByAcc'}
    end    
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def borrow_params
      params.require(:borrow).permit(:title, :name, :account, :isbn, :autor)
    end
end

class ProfilesController < ApplicationController
    before_action :set_book, only: [:new_profile, :new, :create, :destroy]
    def create
    end
    def destroy
    end
    def new
        #@profile = @book.build_profile
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def new_profile
        @profile = @book.build_profile
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    private
        def set_book
            @book = Book.find(params[:book_id])
        end
        
        def profile_params
            params.require(:profile).permit(:copy, :volumen, :tome, :accessible)
        end
end
class ProfilesController < ApplicationController
    before_action :set_book, only: [:new_profile, :new, :create, :destroy]
    
    def create
        byebug
        if @book.create_profile(profile_params)
            redirect_to @book, notice:'Ficha actualizada!'
        else
            redirect_to @book, alert:'Error al salvar la ficha!'
        end
    end
    
    def destroy
    end
    def new
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
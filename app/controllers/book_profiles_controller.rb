class BookProfilesController < ApplicationController
  before_action :set_book_profile, only: [:show, :edit, :update, :destroy]

  # GET /book_profiles
  # GET /book_profiles.json
  def index
    @book_profiles = BookProfile.all
  end

  # GET /book_profiles/1
  # GET /book_profiles/1.json
  def show
  end

  # GET /book_profiles/new
  def new
    @book_profile = BookProfile.new
  end

  # GET /book_profiles/1/edit
  def edit
  end

  # POST /book_profiles
  # POST /book_profiles.json
  def create
    @book_profile = BookProfile.new(book_profile_params)

    respond_to do |format|
      if @book_profile.save
        format.html { redirect_to @book_profile, notice: 'Book profile was successfully created.' }
        format.json { render :show, status: :created, location: @book_profile }
      else
        format.html { render :new }
        format.json { render json: @book_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_profiles/1
  # PATCH/PUT /book_profiles/1.json
  def update
    respond_to do |format|
      if @book_profile.update(book_profile_params)
        format.html { redirect_to @book_profile, notice: 'Book profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_profile }
      else
        format.html { render :edit }
        format.json { render json: @book_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_profiles/1
  # DELETE /book_profiles/1.json
  def destroy
    @book_profile.destroy
    respond_to do |format|
      format.html { redirect_to book_profiles_url, notice: 'Book profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_profile
      @book_profile = BookProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_profile_params
      params.require(:book_profile).permit(:published, :isbn, :title, :autor, :classificacion, :label, :book_id)
    end
end

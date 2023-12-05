class FavouritesController < ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :set_favourite, only: %i[show edit update destroy]

  # GET /favourites or /favourites.json
  def index
    @favourites = Favourite.all
  end

  # GET /favourites/1 or /favourites/1.json
  def show
    user_uid = params[:user_uid]
  puts "Received user_uid: #{user_uid}"

  if user_uid
    @favourites = Favourite.where(user_uid: user_uid)

    respond_to do |format|
      format.json { render json: { favourites: @favourites } }
    end
  else
    render json: { error: 'User not found' }, status: :not_found
  end
end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit
  end

  # POST /favourites or /favourites.json
def create
  @favourite = Favourite.new(favourite_params)

  respond_to do |format|
    if @favourite.save
      format.html { redirect_to favourite_url(@favourite), notice: "Favourite was successfully created." }
      format.json { render :show, status: :created, location: @favourite }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @favourite.errors, status: :unprocessable_entity }
    end
  end
end


  # PATCH/PUT /favourites/1 or /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to favourite_url(@favourite), notice: "Favourite was successfully updated." }
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1 or /favourites/1.json
  def destroy
    @favourite.destroy

    respond_to do |format|
      format.html { redirect_to favourites_url, notice: "Favourite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #this should render only the favourites belonging to the logged in user
def show_favourites
  user_uid = params[:user_uid]
  puts "Received user_uid: #{user_uid}"

  if user_uid
    @favourites = Favourite.where(user_uid: user_uid)

    respond_to do |format|
      format.json { render json: { favourites: @favourites } }
    end
  else
    render json: { error: 'User not found' }, status: :not_found
  end
end


  private

  # Use callbacks to share common setup or constraints between actions.
def set_favourite
  if action_name == 'show_favourites'
    @favourites = Favourite.where(user_uid: params[:user_uid])
  else
    @favourite = Favourite.find_by(id: params[:id])
  end
end


  # Only allow a list of trusted parameters through.
  def favourite_params
    params.require(:favourite).permit(:title, :embed_link, :user_uid, :logged_user)
  end
end

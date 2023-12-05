class YoutubeEntriesController < ApplicationController
    protect_from_forgery with: :exception, unless: -> {request.format.json?}
  before_action :set_youtube_entry, only: %i[ show edit update destroy ]

  # GET /youtube_entries or /youtube_entries.json
  def index
    @youtube_entries = YoutubeEntry.all
  end

  # GET /youtube_entries/1 or /youtube_entries/1.json
  def show
  end

  # GET /youtube_entries/new
  def new
    @youtube_entry = YoutubeEntry.new
  end
  
  #get youtube entries where the user_uid matches the currently logged in user
def show_myvideos
  userName = params[:userName] # Change user_uid to userName
  @youtube_entries = YoutubeEntry.where(user_uid: userName) # Change user_uid to userName
  puts "Received userName: #{userName}" # Change user_uid to userName
  respond_to do |format|
    format.json { render json: { youtube_entries: @youtube_entries } }
  end
end

  # GET /youtube_entries/1/edit
  def edit
  end

  # POST /youtube_entries or /youtube_entries.json
  def create
    @youtube_entry = YoutubeEntry.new(youtube_entry_params)

    respond_to do |format|
      if @youtube_entry.save
        format.html { redirect_to youtube_entry_url(@youtube_entry), notice: "Youtube entry was successfully created." }
        format.json { render :show, status: :created, location: @youtube_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @youtube_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtube_entries/1 or /youtube_entries/1.json
  def update
    respond_to do |format|
      if @youtube_entry.update(youtube_entry_params)
        format.html { redirect_to youtube_entry_url(@youtube_entry), notice: "Youtube entry was successfully updated." }
        format.json { render :show, status: :ok, location: @youtube_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @youtube_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtube_entries/1 or /youtube_entries/1.json
  def destroy
    @youtube_entry.destroy

    respond_to do |format|
      format.html { redirect_to youtube_entries_url, notice: "Youtube entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube_entry
      @youtube_entry = YoutubeEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def youtube_entry_params
      params.require(:youtube_entry).permit(:title, :embed_link, :user_uid, :entryUserUid)
    end
end

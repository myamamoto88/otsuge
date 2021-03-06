class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :login_required, except: [:index]

  # GET /announcements
  def index
    @announcements = Announcement.by_status(params[:status]).paginate(page: params[:page])
  end

  # GET /announcements/1
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.created_user = current_user.identifier
    @announcement.status = :untreated

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /announcements/1
  def update
    respond_to do |format|
      if @announcement.update_and_initialize_status(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /announcements/1
  def destroy
    if @announcement.untreated?
      @announcement.destroy
      result = 'successfully'
    else
      result = 'unsuccessfully'
    end

    respond_to do |format|
      format.html { redirect_to announcements_url, notice: "Announcement was #{result} destroyed." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def announcement_params
    params.require(:announcement).permit(:title, :message, :announce_at, :announce_icon, :announce_name, :channel, :page)
  end
end

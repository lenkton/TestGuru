class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    
    redirect_to admin_badges_path, notice: 'Badge was successfully destroyed.'
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_url, :condition_id)
  end
end

class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  def index
    @notices = Notice.all
  end

  def show
  end

  def new
    @notice = Notice.new
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to @notice, notice: 'Shodan was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @notice.destroy
    redirect_to notices_url, notice: 'Notice was successfully destroyed.'
  end

  def update
    if @notice.update(notice_params)
      redirect_to @notice, notice: 'Shodan was successfully updated.'
    else
      render :new
    end
  end

  private
    def set_notice
      @notice = Notice.find(params[:id])
    end

    def notice_params
      params.require(:notice).permit(:status, :email, :message, :title)
    end
end

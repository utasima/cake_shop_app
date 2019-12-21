class DeliverInfosController < ApplicationController
  before_action :set_deliver_info, only: [:edit, :update, :destroy,]

  def index
    @deliver_info = DeliverInfo.all
    # @deliver_infos = DeliverInfo.find(current_customer.id)
  end
  
  def edit
  end

  def new
    @deliver_info = DeliverInfo.new
  end

  def create
    @deliver_infos = DeliverInfo.all
    @deliver_info = DeliverInfo.new(deliver_info_params)
    # @deliver_info = @customer.deliver_infos.create(published_at: Time.now)
    if @deliver_info.save
      redirect_to deliver_infos_path(@deliver_infos), notice: '住所を追加しました'
    else
      render action: :new
    end
  end
  
  def update
    @deliver_infos = DeliverInfo.all
    if 
      @deliver_info.update(deliver_info_params)
      redirect_to deliver_infos_path(@deliver_infos), notice: '更新しました。'
    else
      render action: :edit
    end
  end

  def destroy
    @deliver_infos = DeliverInfo.all
    @deliver_info.destroy
    redirect_to deliver_infos_path
  end

  private
  def set_deliver_info
    @deliver_info = DeliverInfo.find(params[:id])
  end

  def deliver_info_params
    params.require(:deliver_info).permit(:address, :name, :postal_code)
  end
end

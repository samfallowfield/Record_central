class RecordsController < ApplicationController
  before_action :set_record, only:[:show, :edit, :update, :destroy]

  def index
    @records = Record.paginate(page: params[:page], per_page: 8)
  end

  def show
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    if @record.save
      flash[:notice] = "Listing created successfully!"
      redirect_to records_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      flash[:notice] = "Listing updated successfully!"
      redirect_to @record
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path
  end


  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:artist,:album,:genre,:variant,:description)
  end
end

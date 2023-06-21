class GenresController < ApplicationController

  before_action :require_admin, except: [:index, :show]
  before_action :set_genre, only:[:show, :edit, :update]

  def new
    @genre = Genre.new
  end


  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "Category was created"
      redirect_to @genre
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "Updated"
      redirect_to @genre
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  def index
    @genres = Genre.paginate(page: params[:page], per_page: 8)
  end

  def show
    @records = @genre.records.paginate(page: params[:page], per_page: 5)
  end



  private

  def set_genre
    @genre = Genre.friendly.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to genres_path
    end
  end
end

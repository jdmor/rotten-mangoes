class MoviesController < ApplicationController
  def index
    if Movie.query?(params)
      @query = true
      @movies = Movie.title_or_director(params[:search_term])
      @movies = @movies.runtime_in_minutes(params[:runtime_in_minutes])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title,
      :release_date,
      :director,
      :runtime_in_minutes,
      :poster_image,
      :description
    )
  end

end

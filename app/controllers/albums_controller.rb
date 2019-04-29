class AlbumsController < ProtectedController
  before_action :set_album, only: [:show, :update, :destroy]

  # GET /albums
  def index
    @albums = current_user.albums.all

    render json: @albums
  end

  # GET /albums/1
  def show
    render json: @album
  end

  # POST /albums
  def create
    @album = current_user.albums.build(album_params)

    if @album.save
      render json: @album, status: :created
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: current_user.albums.all
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    render json: current_user.albums.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = current_user.albums.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:title, :artist)
    end
end

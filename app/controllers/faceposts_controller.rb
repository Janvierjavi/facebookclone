class FacepostsController < ApplicationController
  before_action :set_facepost, only: [:show, :edit, :update, :destroy]

  # GET /faceposts
  # GET /faceposts.json
  def index
    @faceposts = Facepost.all
    @user = User.all
  end

  # GET /faceposts/1
  # GET /faceposts/1.json
  def show
    @favorite = current_user.favorites.find_by(facepost_id: @facepost.id)
  end

  # GET /faceposts/new
  def new
    @facepost = Facepost.new

    if params[:back]
      @facepost = Facepost.new(facepost_params)
    else
      @facepost = Facepost.new
    end
  end
  def confirm
    @facepost = Facepost.new(facepost_params)
    #for assosiatiion part
    @facepost.user_id = current_user.id
    binding.pry
    render :new if @facepost.invalid?
  end
  

  # GET /faceposts/1/edit
  def edit
  end

  # POST /faceposts
  # POST /faceposts.json
  def create
    @facepost = Facepost.new(facepost_params)
    #assosiation part
    @facepost.user_id = current_user.id
    #end

    respond_to do |format|
      if @facepost.save
        format.html { redirect_to @facepost, notice: 'Facepost was successfully created.' }
        format.json { render :show, status: :created, location: @facepost }
      else
        format.html { render :new }
        format.json { render json: @facepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faceposts/1
  # PATCH/PUT /faceposts/1.json
  def update
    respond_to do |format|
      if @facepost.update(facepost_params)
        format.html { redirect_to @facepost, notice: 'Facepost was successfully updated.' }
        format.json { render :show, status: :ok, location: @facepost }
      else
        format.html { render :edit }
        format.json { render json: @facepost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faceposts/1
  # DELETE /faceposts/1.json
  def destroy
    @facepost.destroy
    respond_to do |format|
      format.html { redirect_to faceposts_url, notice: 'Facepost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facepost
      @facepost = Facepost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facepost_params
      params.require(:facepost).permit(:content, :image, :image_cache)
    end
end

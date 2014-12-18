class PostListsController < ApplicationController
  before_action :set_post_list, only: [:show, :edit, :update, :destroy]

  # GET /post_lists
  # GET /post_lists.json
  def index
    @post_lists = PostList.all
  end

  # GET /post_lists/1
  # GET /post_lists/1.json
  def show
  end

  # GET /post_lists/new
  def new
    @post_list = PostList.new
  end

  # GET /post_lists/1/edit
  def edit
  end

  # POST /post_lists
  # POST /post_lists.json
  def create
    @post_list = PostList.new(post_list_params)

    respond_to do |format|
      if @post_list.save
        format.html { redirect_to @post_list, notice: 'Post list was successfully created.' }
        format.json { render :show, status: :created, location: @post_list }
      else
        format.html { render :new }
        format.json { render json: @post_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_lists/1
  # PATCH/PUT /post_lists/1.json
  def update
    respond_to do |format|
      if @post_list.update(post_list_params)
        format.html { redirect_to @post_list, notice: 'Post list was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_list }
      else
        format.html { render :edit }
        format.json { render json: @post_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_lists/1
  # DELETE /post_lists/1.json
  def destroy
    @post_list.destroy
    respond_to do |format|
      format.html { redirect_to post_lists_url, notice: 'Post list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_list
      @post_list = PostList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_list_params
      params.require(:post_list).permit(:label, :description, :price, :photo)
    end
end

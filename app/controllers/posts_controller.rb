class PostsController < ApplicationController
  before_action :set_user_posts
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = @user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = @user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        # PostMailer.post_information(@post).deliver
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.' }
        format.js { @return_msg = " Successful"}
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.js { @return_msg = " Failed"}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_post_path(@user, @post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @user.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

    def set_user_posts
      @user = User.find(params[:user_id])
    end

    def custom_form
    end

  def process_custom_data
    # render :text => params[:query_1] + params[:query_2]
    # render :text => "No1 is #{params[:age]}, No2 is #{params[:old_age]}"
    post = Post.new
    # post = Post.new(params[:search])
    # user= User.new(params[:user])
    post.title = params[:query_1]
    if post.save
      flash[:notice] = "saved"
      redirect_to posts_path
    else
      flash[:alert] = "failed"
      render custom_form
    end 
  end

    def process_custom_data(post)
    end
    
end

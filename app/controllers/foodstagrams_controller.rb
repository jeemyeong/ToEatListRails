class FoodstagramsController < ApplicationController
  before_action :set_foodstagram, only: [:show, :edit, :update, :destroy]

  # GET /foodstagrams/makingData
  def makingData
    instagram_uri_with_tag = "https://www.instagram.com/explore/tags/%EB%A7%9B%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8/"
    uri = URI(instagram_uri_with_tag)
    scriptData = Nokogiri::HTML(Net::HTTP.get(uri), nil, Encoding::UTF_8.to_s).css("script").inner_text

    if scriptData.split(';')[6].include? 'sharedData'
      rawJsonData = ActiveSupport::JSON.decode(scriptData.split(';')[6].split(' = ')[1])
      jsonDataWithTag = rawJsonData["entry_data"]["TagPage"][0]["tag"]
      tagName = jsonDataWithTag["name"]
      plainPostsJsonData = jsonDataWithTag["media"]["nodes"]
      topPostsJsonData = jsonDataWithTag["top_posts"]["nodes"]

      plainPostsJsonData.each do |post|
        Foodstagram.create(tag: post["caption"], img: post["thumbnail_src"], instagram_id: post["id"])
        #Post.create(tag: post["caption"], img: post["display_src"]) #else with display_src
      end
    end
    redirect_to '/foodstagrams'
  end

  # GET /foodstagrams
  # GET /foodstagrams.json
  def index
    @foodstagrams = Foodstagram.all
  end

  # GET /foodstagrams/1
  # GET /foodstagrams/1.json
  def show
  end

  # GET /foodstagrams/new
  def new
    @foodstagram = Foodstagram.new
  end

  # GET /foodstagrams/1/edit
  def edit
  end

  # POST /foodstagrams
  # POST /foodstagrams.json
  def create
    @foodstagram = Foodstagram.new(foodstagram_params)

    respond_to do |format|
      if @foodstagram.save
        format.html { redirect_to @foodstagram, notice: 'Foodstagram was successfully created.' }
        format.json { render :show, status: :created, location: @foodstagram }
      else
        format.html { render :new }
        format.json { render json: @foodstagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foodstagrams/1
  # PATCH/PUT /foodstagrams/1.json
  def update
    respond_to do |format|
      if @foodstagram.update(foodstagram_params)
        format.html { redirect_to @foodstagram, notice: 'Foodstagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @foodstagram }
      else
        format.html { render :edit }
        format.json { render json: @foodstagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foodstagrams/1
  # DELETE /foodstagrams/1.json
  def destroy
    @foodstagram.destroy
    respond_to do |format|
      format.html { redirect_to foodstagrams_url, notice: 'Foodstagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodstagram
      @foodstagram = Foodstagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodstagram_params
      params.require(:foodstagram).permit(:instagram_id, :img, :tag)
    end
end

class OpinionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_opinion, only: %i[ show edit update destroy ]

  # GET /opinions or /opinions.json
  def index
    @opinions = Opinion.all
  end
  # to do web_scrapping
  def scrape
    url = 'https://www.bodas.net/musica/la-gramola-discotecas-moviles--e15600/opiniones'
    response = OpinionsSpider.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end

  # GET /opinions/1 or /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions or /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to @opinion, notice: "Opinion was successfully created." }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1 or /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: "Opinion was successfully updated." }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1 or /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: "Opinion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opinion_params
      params.require(:opinion).permit(:title, :body, :ratingStar, :name, :wedding_date)
    end
end

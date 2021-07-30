class WebConfigsController < ApplicationController
  before_action :set_web_config, only: %i[ show edit update destroy ]

  # GET /web_configs or /web_configs.json
  def index
    add_breadcrumb 'Configuración general'
    @web_config = WebConfig.first
  end

  # GET /web_configs/1 or /web_configs/1.json
  def show
  end

  # GET /web_configs/new
  def new
    @web_config = WebConfig.new
  end

  # GET /web_configs/1/edit
  def edit
  end

  # POST /web_configs or /web_configs.json
  def create
    @web_config = WebConfig.new(web_config_params)

    respond_to do |format|
      if @web_config.save
        format.html { redirect_to @web_config, notice: "Web config was successfully created." }
        format.json { render :show, status: :created, location: @web_config }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @web_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_configs/1 or /web_configs/1.json
  def update
    @web_config = WebConfig.first
    respond_to do |format|
      if @web_config.update(web_config_params)
        format.html { redirect_to @web_config, notice: "Web config was successfully updated." }
        format.json { render :show, status: :ok, location: @web_config }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @web_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_configs/1 or /web_configs/1.json
  def destroy
    @web_config.destroy
    respond_to do |format|
      format.html { redirect_to web_configs_url, notice: "Web config was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_config
      @web_config = WebConfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def web_config_params
      params.require(:web_config).permit(:enterprise_name, :url_web, :cif, 
                                        :corporative_color, :global_email, :contact_phone, 
                                        :url_facebook, :url_instagram, :url_twitter, :url_pinterest,
                                        :url_bodas_net, :meta_title, :meta_description,
                                        :ftp_user, :ftp_password, :secret_key_recaptcha, :public_key_recaptcha)
    end
end

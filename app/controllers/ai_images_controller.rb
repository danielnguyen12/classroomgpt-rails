class AiImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @ai_images = current_user.ai_images
  end

  def new
    @ai_image = AiImage.new
  end

  def create
    # client = OpenAI::Client.new
    prompt = ai_image_params[:prompt]
    puts prompt
    # response = client.images.generate(
    #   parameters: {
    #     prompt: prompt,
    #     size: "256x256"
    #     }
    #   )
    # puts response.dig("data", 0, "url")
    @ai_image = AiImage.new(prompt: prompt, img_url: "https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516__340.jpg")

    if @ai_image.save
      redirect_to :index, notice: 'AI Image was successfully created.'
    else
      render :new, notice: :unprocessable_entity
    end
  end

  private

  def ai_image_params
    params.require(:ai_image).permit(:prompt, :img_url)
  end
end

class AiImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @ai_images = current_user.ai_images
  end

  def new
    @ai_image = AiImage.new
  end

  # Create action is working as expected. Commented out to save money
  # def create
  #   client = OpenAI::Client.new
  #   prompt = image_request_params[:prompt]
  #   response = client.images.generate(
  #     parameters: {
  #       prompt: prompt,
  #       size: "256x256"
  #       }
  #     )
      # if the image generation is successful, save the prompt and image URL to ai_image object
  #   if response.success?
  #     puts response.dig("data", 0, "url")
  #     @img_url = response["data"].first["url"]
  #     @ai_image = AiImage.new(user: current_user, prompt: @prompt, img_url: @img_url)

  #     if @ai_image.save
  #       redirect_to ai_images_path, notice: 'AI Image was successfully created.'
  #     else
  #       render :new, notice: :unprocessable_entity
  #     end
  #   else
  #     error_message = response.body["message"]
  #     redirect_to new_ai_image_path, alert: "Failed to generate image: #{error_message}"
  #   end

  def create #create action for testing
    prompt = image_request_params[:prompt]
    @ai_image = AiImage.create!(user: current_user, prompt: prompt, img_url: "https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516__340.jpg")
      if @ai_image.save
        redirect_to ai_images_path, notice: 'AI Image was successfully created.'
      else
        render :new, notice: :unprocessable_entity
      end
  end

  private

  def image_request_params
    params.require(:ai_image).permit(:prompt)
  end
end

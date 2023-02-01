class AiImagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def image_request
    client = OpenAI::Client.new
    prompt = image_request_params[:prompt]
    response = client.images.generate(
      parameters: {
        prompt: prompt,
        size: "256x256"
        }
      )
    puts response.dig("data", 0, "url")
  end

  private

  def image_request_params
    params.require(:image_request).permit(:prompt)
  end
end

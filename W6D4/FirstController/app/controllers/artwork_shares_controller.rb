class ArtworkSharesController < ApplicationController
  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json: artwork_share
    else 
      render artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])

    artwork_share.destroy  
    render json: artwork_share
  end

  private

  def artwork_share_params 
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end
end

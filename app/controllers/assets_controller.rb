class AssetsController < ApplicationController

    def mode
        @assets = Asset.find_by(user_id: @current_user.id)
        
        if @assets
            @assets.cs_aset = params[:type]
            @assets.save
            redirect_to('/home')
        else
            @assets = Asset.new(
                user_id: @current_user.id,
                cs_aset: params[:type]
            )
            @assets.save
            redirect_to('/home')
        end
    end
end

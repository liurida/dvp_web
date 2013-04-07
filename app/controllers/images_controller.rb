class ImagesController < ApplicationController
  def serve
    begin
      @record = User.find_by_login(params[:login_id])
      @img = @record.ldap_info.thumbnailphoto.first
      send_data @img, :type => 'png', :disposition => 'inline'
    rescue
      file = Rails.root.join("public", "avatar_icon.png").to_s
      send_data File.open(file).read, :type => 'png', :disposition => 'inline'
    end
  end
end

class ImagesController < ApplicationController
  def serve
    record = User.find_by_login(params[:login_id])
    if  record and @img = record.ldap_info.thumbnailphoto.first
      send_data @img, :type => 'png', :disposition => 'inline'
    else
      send_data nil
    end
  end
end

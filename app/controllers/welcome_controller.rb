class WelcomeController < ApplicationController
  def index
    api = MailRU::API.new do |c|
      c.app_id = '712528'
      c.uid = current_user.uid
      c.secret_key = '0e32955d16d9b578fde43a229cdbc277'
      c.private_key = '1700881e6929683bc616265ae3f82171'
    end
    #raise api.photos.get_albums.inspect
    raise api.photos.get(aid: '_myphoto').inspect
  end
end

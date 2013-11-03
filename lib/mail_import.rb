class MailImport
  def initialize(uid)
    @uid = uid
  end

  def api
    @api ||= MailRU::API.new do |c|
      c.app_id = '712528'
      c.uid = @uid
      c.secret_key = '0e32955d16d9b578fde43a229cdbc277'
      c.private_key = '1700881e6929683bc616265ae3f82171'
    end
  end

  def photo_each
    api.photos.get_albums.each do |album|
      api.photos.get(aid: album['aid']).each do |photo|
        yield(photo)
      end
    end
  end

end

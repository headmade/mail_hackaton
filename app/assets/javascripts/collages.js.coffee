class Collage

  constructor: (@container) ->
    @container = $(@container)
    @photos = @container.find('#collage_photos')
    @container.find('.th').on 'click', (e) =>
      @photo_click($(e.target))

  photo_click: (photo) ->
    photo.toggleClass 'selected'
    selected = @container.find('img.selected')
    if selected.length <= 5
      str = []
      for sp in selected
        str.push $(sp).data('id')
      console.log @photos
      @photos.val str.join(',')
    else
      photo.toggleClass 'selected'
      alert 'max foto'


$ ->
  new Collage $('.collage-js')


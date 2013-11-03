class Collage

  constructor: (@container) ->
    @container = $(@container)
    @container.find('.th').on 'click', (e) =>
      @photo_click($(e.target))

  photo_click: (photo) ->
    console.log photo.data('id')


$ ->
  new Collage $('.collage-js')


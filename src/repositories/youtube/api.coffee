Promise = require 'bluebird'
YoutubeBaseRepository = require './base'
VideoEntity = require '../../entities/video'

class YoutubeAPIRepository extends YoutubeBaseRepository

  constructor: (@client) ->

  findByTitle: (title) ->
    new Promise (resolve, reject) =>
      @client.search title, 4, (resultData) ->
        # Reducimos los 4 primeros resultados de youtube para buscar coincidencias exactos
        # Ya que el mejor resultado no siempre sale en la primera posción. Pero si ninguno de
        # los 4 primeros es resultado exacto. Como fallback elegimos el primero
        resolve (resultData?.items.reduce (memo, video) ->
          entity = new VideoEntity video
          if entity.title is title then entity else memo
        , null) or new VideoEntity resultData?.items?[0]

  titleById: (id) ->
    Promise.resolve( @findById(id) ).then (video) ->
      return video.title
      

  findById: (id) ->
    new Promise (resolve, reject) =>
      @client.getById id, (resultData) ->
        resolve new VideoEntity resultData?.items?[0]

module.exports = YoutubeAPIRepository

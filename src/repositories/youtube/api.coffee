YoutubeBaseRepository = require './base'
VideoEntity = require '../../entities/video'

class YoutubeAPIRepository extends YoutubeBaseRepository

  constructor: (@client) ->

  findByTitle: (title) ->
    new Promise (resolve, reject) =>
      @client.search title, 1, (resultData) ->
        resolve new VideoEntity resultData?.items?[0]

module.exports = YoutubeAPIRepository

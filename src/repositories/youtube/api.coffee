YoutubeBaseRepository = require './base'

class YoutubeAPIRepository extends YoutubeBaseRepository
  constructor: (@client) ->
  findByTitle: (title, cb) ->
    @client.search title, 1, (resultData) ->
      cb null, resultData

module.exports = YoutubeAPIRepository

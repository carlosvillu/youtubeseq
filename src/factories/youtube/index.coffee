config = require '../../../config'
Promise = require 'bluebird'
YouTube = require('youtube-node')
YoutubeAPIRepository = require '../../repositories/youTube/api'

class YoutubeFactory
  @youtubeRepository: (type) ->
    switch type
      when 'API'
        youTube = new YouTube()
        youTube.setKey config.get 'YOUTUBEAPI'
        
        # TODO: Singleton instance
        return new YoutubeAPIRepository youTube

module.exports = YoutubeFactory

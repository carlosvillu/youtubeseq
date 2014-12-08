config = require '../../../config'
YouTube = require 'youtube-node'
YoutubeAPIRepository = require '../../repositories/youTube/api'

console.log config.get 'YOUTUBEAPI'
class YoutubeFactory
  @youtubeRepository: (type) ->
    switch type
      when 'API'
        youTube = new YouTube()
        youTube.setKey config.get 'YOUTUBEAPI'
        return new YoutubeAPIRepository youTube

module.exports = YoutubeFactory

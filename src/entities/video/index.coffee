class VideoEntity
  constructor: (data) ->
    @videoId = data.id.videoId
    {@title, @description, @thumbnails, @channelId} = data.snippet

module.exports = VideoEntity

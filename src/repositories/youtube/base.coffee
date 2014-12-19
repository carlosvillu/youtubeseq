class YoutubeBaseRepository
  
  findByTitle: -> throw new Error "YoutubeBaseRepository#findByTitle"
  findById: -> throw new Error "YoutubeBaseRepository#findById"
  titleById: -> throw new Error "YoutubeBaseRepository#titleById"

module.exports = YoutubeBaseRepository

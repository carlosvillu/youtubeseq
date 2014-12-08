debug = require( 'debug' )
log = debug( 'youtubeseq-log' )

SequenceForVideoService = require './services/sequence_for_video'
SequenceForVideoRequest = require './services/sequence_for_video/request'
YoutubeFactory = require './factories/youtube'

log "%j", YoutubeFactory.youtubeRepository( 'API' )

new SequenceForVideoService( YoutubeFactory.youtubeRepository( 'API' ) ).execute new SequenceForVideoRequest( 'World War z Trailer' ), (err, videos) ->
  log "%j", arguments

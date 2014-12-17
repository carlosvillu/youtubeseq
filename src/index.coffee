debug = require( 'debug' )
log = debug( 'youtubeseq-log' )

SequenceForVideoService = require './services/sequence_for_video'
SequenceForVideoRequest = require './services/sequence_for_video/request'
YoutubeFactory = require './factories/youtube'

title = "El Proyecto Revelación 2/2"
title = "Audio-libro Ley de atracción Parte 3/4"

new SequenceForVideoService( YoutubeFactory.youtubeRepository( 'API' ) ).execute(new SequenceForVideoRequest( title )).done (results) ->
  log "Para el título %s la secuencia es %j", title, results.map (result) -> "#{result.title}[#{result.videoId}]"

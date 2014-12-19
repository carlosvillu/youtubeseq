Promise = require 'bluebird'
Service = require '../service'
sequence = require 'sequence-titles'
debug = require( 'debug' )
log = debug( 'youtubeseq-log' )
Promise = require 'bluebird'

class SequenceForVideoService extends Service
  constructor: (@repository) ->
  execute: Promise.method (request) ->
    log sequence.isSequence( request.title )
    if !sequence.isSequence( request.title )
      @repository.findByTitle request.title
    else
      Promise.all sequence.sequence( request.title ).map (title) => @repository.findByTitle title

module.exports = SequenceForVideoService

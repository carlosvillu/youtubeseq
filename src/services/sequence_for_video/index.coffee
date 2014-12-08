Service = require '../service'

class SequenceForVideoService extends Service
  constructor: (@repository) ->
  execute: (request, cb) ->
    @repository.findByTitle request.title, cb

module.exports = SequenceForVideoService

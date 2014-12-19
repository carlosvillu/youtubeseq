SequenceForVideoService = require '../../services/sequence_for_video'
SequenceForVideoRequest = require '../../services/sequence_for_video/request'

class SequenceForVideoFactory
  @service: (repository) ->
    return new SequenceForVideoService repository
  @request: (title) ->
    return new SequenceForVideoRequest title

module.exports = SequenceForVideoFactory

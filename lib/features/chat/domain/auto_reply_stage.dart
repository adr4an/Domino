enum TAutoReplyStage {
  idle, // nothing sent yet
  awaitingDetails, // a chip was answered, waiting for the user's details
  done, // handoff message sent, auto chat stays silent
}

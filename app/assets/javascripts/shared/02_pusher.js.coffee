# faye.js should be ported before application.js in layout, so we got Faye.Client here
Pusher =
  init: ()=>
    return if Pusher.client?
    # Create client
    Pusher.client = new Faye.Client '/faye'
    # Add extension for authentication
    Pusher.client.addExtension
      outgoing: (message, callback)=>
        message._token = $("meta[name='push-token']").attr "content"
        callback message

@Pusher = Pusher

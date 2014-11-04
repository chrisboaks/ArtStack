window.ArtStack = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    new ArtStack.Routers.Router({
      $rootEl: $("main")
    });
    ArtStack.artworks = new ArtStack.Collections.Artworks();
    ArtStack.artworks.fetch();

    ArtStack.artists = new ArtStack.Collections.Artists();
    ArtStack.artists.fetch();

    ArtStack.users = new ArtStack.Collections.Users();

    Backbone.history.start();
  }
};

$(document).ready(function(){
  ArtStack.initialize();
});

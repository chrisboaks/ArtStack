window.ArtStack = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ArtStack.Routers.ArtworksRouter({
      $rootEl: $("main")
    });
    ArtStack.artworks = new ArtStack.Collections.Artworks();
    ArtStack.artworks.fetch();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ArtStack.initialize();
});

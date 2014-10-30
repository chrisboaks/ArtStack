window.ArtStack = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new ArtStack.Routers.Router({
      $rootEl: $("#backbone-content")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  ArtStack.initialize();
});

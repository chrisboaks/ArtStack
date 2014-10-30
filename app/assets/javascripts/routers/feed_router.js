ArtStack.Routers.FeedRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "index"
  },

  index: function () {
    var artworks = ArtStack.Collections.artworks
    var indexView = new ArtStack.Views.ArtworksIndex({collection: artworks});
    this._swapview(indexView);
  },

  _swapview: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

})
ArtStack.Routers.ArtworksRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "artworks": "index",
    "artworks/:id": "show"
  },

  index: function () {
    var artworks = ArtStack.artworks;
    var indexView = new ArtStack.Views.ArtworksIndex( { collection: artworks } );
    this._swapview(indexView);
  },

  show: function (id) {
    console.log("here")
    var artwork = ArtStack.artworks.getOrFetch(id);
    var showView = new ArtStack.Views.ArtworkShow( { model: artwork });
    this._swapview(showView);
  },

  _swapview: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

})
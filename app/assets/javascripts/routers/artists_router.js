ArtStack.Routers.ArtistsRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "artists": "index",
    "artists/:id": "show"
  },

  index: function () {
    var artists = ArtStack.artists;
    var indexView = new ArtStack.Views.ArtistsIndex( { collection: artists } );
    this._swapview(indexView);
  },

  show: function (id) {
    var artist = ArtStack.artists.getOrFetch(id);
    var showView = new ArtStack.Views.ArtistShow( { model: artist });
    this._swapview(showView);
  },

  _swapview: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
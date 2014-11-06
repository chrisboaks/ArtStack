ArtStack.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "artworksIndex",
    "_=_": "artworksIndex",           // For seamless Facebook logins
    "artists/:id": "artistShow",
    "artists": "artistsIndex",
    "artworks/:id": "artworkShow",
    "users/:id": "userShow"
  },

  artistsIndex: function () {
    var artists = ArtStack.artists;
    var indexView = new ArtStack.Views.ArtistsIndex({ collection: artists });
    this._swapview(indexView);
  },

  artistShow: function (id) {
    var artist = ArtStack.artists.getOrFetch(id);
    var showView = new ArtStack.Views.ArtistShow({ model: artist });
    this._swapview(showView);
  },

  artworksIndex: function () {
    var artworks = ArtStack.artworks;
    var indexView = new ArtStack.Views.ArtworksIndex({ collection: artworks });
    this._swapview(indexView);
  },

  artworkShow: function (id) {
    var artwork = ArtStack.artworks.getOrFetch(id);
    var showView = new ArtStack.Views.ArtworkShow({ model: artwork });
    this._swapview(showView);
  },

  userShow: function (id) {
    var user = new ArtStack.Models.User({ id: id })
    user.fetch()
    var showView = new ArtStack.Views.UserShow({ model: user });
    this._swapview(showView);
  },

  _swapview: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});

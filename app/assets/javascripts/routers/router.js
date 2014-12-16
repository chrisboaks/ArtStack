ArtStack.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "artworksIndexSmall",
    "home": "userHome",
    "explore": "artworksIndexSmall",
    "explore-list": "artworksIndexLarge",
    "explore-grid": "artworksIndexSmall",
    "_=_": "artworksIndexSmall",           // For seamless Facebook logins
    "artists/:id": "artistShow",
    "artworks/:id": "artworkShow",
    "users/:id": "userShow",
  },

  artistShow: function (id) {
    var artist = ArtStack.artists.getOrFetch(id);
    var showView = new ArtStack.Views.ArtistShow({ model: artist });
    this._swapview(showView);
  },

  artworksIndexSmall: function () {
    $('.list-layout-button').removeClass('active');
    $('.grid-layout-button').addClass('active');
    var artworks = ArtStack.artworks;
    var indexView = new ArtStack.Views.ArtworksIndexSmall({ collection: artworks });
    this._swapview(indexView);
  },

  artworksIndexLarge: function () {
    $('.grid-layout-button').removeClass('active');
    $('.list-layout-button').addClass('active');
    var artworks = ArtStack.artworks;
    var indexView = new ArtStack.Views.ArtworksIndexLarge({ collection: artworks });
    this._swapview(indexView);
  },

  artworkShow: function (id) {
    var artwork = ArtStack.artworks.getOrFetch(id);
    var showView = new ArtStack.Views.ArtworkShow({ model: artwork });
    this._swapview(showView);
  },

  userShow: function (id) {
    var user = new ArtStack.Models.User({ id: id });
    user.fetch();
    var showView = new ArtStack.Views.UserShow({ model: user });
    this._swapview(showView);
  },

  userHome: function () {
    var artworks = new ArtStack.Collections.Home();
    artworks.fetch();
    var indexView = new ArtStack.Views.UserHome({ collection: artworks });
    this._swapview(indexView);
  },

  _swapview: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});

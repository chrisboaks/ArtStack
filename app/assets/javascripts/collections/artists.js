ArtStack.Collections.Artists = Backbone.Collection.extend({

  url: '/api/artists',

  model: ArtStack.Models.Artist,

  getOrFetch: function (id) {
    var artist = this.get(id);
    var artists = this;

    if (!artist) {
      artist = new ArtStack.Models.Artist({ id: id });
      artist.fetch({
        success: function () {
          artists.add(artist);
        }
      });
    } else {
      artist.fetch();
    }
    return artist;
  },

});
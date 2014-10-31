ArtStack.Models.Artist = Backbone.Model.extend({

  urlRoot: "/api/artists",

  parse: function (json) {
    if (json.artworks) {
      this.artworks = new ArtStack.Collections.Artworks(json.artworks, { parse: true });
      delete json.artworks;
    }
    return json;
  },

});
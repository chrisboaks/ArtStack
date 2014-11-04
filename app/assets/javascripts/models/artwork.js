ArtStack.Models.Artwork = Backbone.Model.extend({

  urlRoot: '/api/artworks',

  parse: function (json) {
    console.log(json)
    if (json.artist) {
      this.artist = new ArtStack.Models.Artist(json.artist);
      delete json.artist;
    };
    return json;
  },

});

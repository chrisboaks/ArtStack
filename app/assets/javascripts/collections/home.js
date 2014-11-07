ArtStack.Collections.Home = Backbone.Collection.extend({

  url: '/api/home',

  model: ArtStack.Models.Artwork,

  getOrFetch: function (id) {
    var artwork = this.get(id);
    var artworks = this;

    if (!artwork) {
      artwork = new ArtStack.Models.Artwork({ id: id });
      artwork.fetch({
        success: function () {
          artworks.add(artwork);
        }
      });
    } else {
      artwork.fetch();
    }
    return artwork;
  },

  comparator: function (model) {
    return model.id;
  },

});

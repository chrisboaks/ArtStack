ArtStack.Collections.Artworks = Backbone.Collection.extend({

  url: '/api/artworks',

  model: ArtStack.Models.Artwork,

  getOrFetch: function (id) {
    var artwork = this.get(id);
    var artworks = this;
    console.log(artworks);

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
    // if (model1.get("created_at") > model2.get("created_at")) {
    //   return 1;
    // } else if (model1.get("created_at") < model2.get("created_at")) {
    //
    // } else {
    //   return 0
    // }


    return -Date.parse(model.get("created_at"));
  },

});
ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/artworks_index'],

  initialize: function () {
    this.listenTo(this.collection, "add", this.addArtwork);
    // this.listenTo(this.collection, "sync", this.render);
    this.subviews = [];
    this.ul_lengths = [0, 0, 0];
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    var that = this;

    this.collection.each(this.addArtwork.bind(this));

    return this;
  },

  addArtwork: function (artwork) {

    var $uls = this.$('ul');
    var view = new ArtStack.Views.SmallArtworkLI({ model: artwork });
    this.subviews.push(view);
    var shortest_ul_index = 0;

    for (var i = 0; i < 3; i++) {
      if (this.ul_lengths[shortest_ul_index] > this.ul_lengths[i]) {
        shortest_ul_index = i;
      }
    }

    $uls.eq(shortest_ul_index).prepend(view.render().$el);
    this.ul_lengths[shortest_ul_index] += artwork.get('height');

  },

  remove: function () {
    _(this.subviews).each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

});

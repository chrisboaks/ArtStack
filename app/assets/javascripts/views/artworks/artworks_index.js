ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/artworks_index'],

  initialize: function () {
    this.listenTo(this.collection, "add", this.addArtwork);
    this.subviews = [];
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    var that = this;

    this.collection.each(function (artwork) {
      that.addArtwork(artwork);
    });

    return this;
  },

  addArtwork: function (artwork) {

    var uls = $('#backbone-content ul').toArray();

    var view = new ArtStack.Views.SmallArtworkLI({ model: artwork });
    this.subviews.push(view);

    var lowest = uls.reduce(function (a, b) {
      return $(a).height() < $(b).height() ? a : b;
    });

    $(lowest).append(view.render().$el);

  },
  
  remove: function () {
    this.subviews.each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

});

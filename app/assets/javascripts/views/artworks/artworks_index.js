ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/artworks_index'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.subviews = [];
  },

  events: {
    "click button": "toggleStack"
    //TODO
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    var that = this;

    var uls = $('#backbone-content ul').toArray();

    this.collection.each(function (artwork) {

      var view = new ArtStack.Views.ArtworksIndexArtworkLI({ model: artwork });
      that.subviews.push(view);

      var lowest = uls.reduce(function (a, b) {
        return $(a).height() < $(b).height() ? a : b;
      });

      $(lowest).append(view.render().$el);
    });
    return this;
  },

  remove: function () {
    this.subviews.each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

  toggleStack: function (event) {
    //TODO
  },

});

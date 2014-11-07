ArtStack.Views.ArtistShow = Backbone.View.extend({

  template: JST['artists/artist_show'],

  followTemplate: JST['follows/_follow_button'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
    this.ul_lengths = [0, 0];
  },

  events: {
    "click button.follow-button": "toggleFollow"
  },

  render: function () {
    var renderedContent = this.template({ artist: this.model });
    var followButton = this.followTemplate({ followable: this.model });
    this.$el.html(renderedContent);
    this.$el.prepend(followButton);

    var that = this;
    var uls = $('ul.artist-show-list').toArray();

    if (this.model.artworks) {
      this.model.artworks.each(function (artwork) {
        var view = new ArtStack.Views.MediumArtworkLI({ model: artwork });
        that.subviews.push(view);

        var shortest_ul_index = that.ul_lengths[0] < that.ul_lengths[1] ? 0 : 1;

        $(uls[shortest_ul_index]).prepend(view.render().$el);
        that.ul_lengths[shortest_ul_index] += artwork.get('height');

      });
    };

    return this;
  },

  addArtwork: function (artwork) {
    var view = new ArtStack.Views.MediumArtworkLI({ model: artwork });
    this.subviews.push(view);

    var shortest_ul_index = this.ul_lengths[0] < this.ul_lengths[1] ? 0 : 1;

    $(uls[shortest_ul_index]).prepend(view.render().$el);
    that.ul_lengths[shortest_ul_index] += artwork.get('height');
  },

  toggleFollow: function (event) {
    var that = this;
    event.preventDefault();

    if (this.model.get('followed')) {

      $("button.follow-button").addClass("followed-false");
      $("button.follow-button").removeClass("followed-true");

      $.ajax({
        type: "DELETE",
        url: "/api/follows/" + this.model.get("follow_id"),
        success: function() {
          that.model.fetch();
        }
      });

    } else {

      $("button.follow-button").addClass("followed-true");
      $("button.follow-button").removeClass("followed-false");

      $.ajax({
        type: "POST",
        url: "/api/follows/",
        data: {
          followable_id: this.model.get('id'),
          followable_type: 'Artist'
        },
        success: function() {
          that.model.fetch();
        }
      });

    }
  },

});

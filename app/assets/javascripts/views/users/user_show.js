ArtStack.Views.UserShow = Backbone.View.extend({

  template: JST['users/user_show'],

  profileTemplate: JST['users/_user_profile'],

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
    var renderedContent = this.template({ user: this.model });
    var profileContent = this.profileTemplate({ user: this.model });
    
    var followButton = this.followTemplate({ followable: this.model });

    this.$el.html(renderedContent);
    this.$el.find('#user-profile').append(profileContent);
    this.$el.prepend(followButton);

    that = this;
    if (this.model.user_artworks) {
      this.model.user_artworks.each(function (artwork) {
        that.addArtwork(artwork);
      });
    };

    return this;
  },

  addArtwork: function (artwork) {
    var uls = $('ul.artist-show-list').toArray();
    var view = new ArtStack.Views.MediumArtworkLI({ model: artwork });
    that.subviews.push(view);

    var shortest_ul_index = that.ul_lengths[0] < that.ul_lengths[1] ? 0 : 1;

    $(uls[shortest_ul_index]).prepend(view.render().$el);
    that.ul_lengths[shortest_ul_index] += artwork.get('height');
  },

  toggleFollow: function (event) {
    event.preventDefault();

    if (this.model.get('followed')) {

      $("button.follow-button").addClass("followed-false");
      $("button.follow-button").removeClass("followed-true");
      this.model.set({ followed: false });

      $.ajax({
        type: "PATCH",
        url: "/api/users/" + this.model.id,
        data: {
          follow: false
        }
      });

    } else {

      $("button.follow-button").addClass("followed-true");
      $("button.follow-button").removeClass("followed-false");
      this.model.set({ followed: true });

      $.ajax({
        type: "PATCH",
        url: "/api/users/" + this.model.id,
        data: {
          follow: true
        }
      });
    }
  },

});

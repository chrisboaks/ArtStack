ArtStack.Views.ArtworksIndexArtworkLI = Backbone.View.extend({

  template: JST['artworks/_artworks_index_artwork_li'],

  stackTemplate: JST['stacks/_stack_button'],

  tagName: "li",

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click button": "toggleStack"
  },

  render: function () {
    var renderedContent = this.template({ artwork: this.model });
    var button = this.stackTemplate({ artwork: this.model });
    this.$el.html(renderedContent);
    this.$el.append(button);
    return this;
  },

  toggleStack: function (event) {
    var that = this;
    event.preventDefault();

    if (this.model.get('stacked')) {
      $.ajax({
        type: "DELETE",
        url: "/api/stacks/" + this.model.get("stack_id"),
        success: function() {
          that.model.fetch();
        }
      });

    } else {
      $.ajax({
        type: "POST",
        url: "/api/stacks/",
        data: {
          artwork_id: this.model.get('id')
        },
        success: function() {
          that.model.fetch();
        }
      });

    }
  },

});

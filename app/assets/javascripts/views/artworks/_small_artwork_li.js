ArtStack.Views.SmallArtworkLI = Backbone.View.extend({

  template: JST['artworks/_small_artwork_li'],

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

    this.$(".art-image").append(button);
    return this;
  },

  toggleStack: function (event) {
    var that = this;
    event.preventDefault();

    if (this.model.get('stacked')) {
      $("button").addClass("stacked-false");
      $("button").removeClass("stacked-true");
      $.ajax({
        type: "DELETE",
        url: "/api/stacks/" + this.model.get("stack_id"),
        success: function() {
          that.model.fetch();
        }
      });

    } else {
      $("button").addClass("stacked-true");
      $("button").removeClass("stacked-false");
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

#Concept:
This site is a clone of theartstack.com, and it functions as a Pinterest-type site oriented toward sharing fine art.  Individual artworks can be "stacked" (i.e. saved to a personal collection) and both artists and users can be followed as sources for new artworks.

#Technologies:
The site is a Ruby on Rails app that interacts with a PostgreSQL database to save information and Backbone.js to present pages.  New artworks can be saved to an Amazon S3 bucket via the Paperclip gem.  User stacks are saved with AJAX queries to a custom API.  jQuery and CSS are used to display stack/follow information, allowing for a seamless UX.

#Todos:
- Search
- Endless scroll
- Comments
- Custom error pages
- About-type page
- Tour
- More flash msgs
- Notifications
- Emails/texts (twilio)

[![Analytics](https://ga-beacon.appspot.com/UA-57200015-1/chrisboaks/artstack)](https://github.com/igrigorik/ga-beacon)

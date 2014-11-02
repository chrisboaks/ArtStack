#Concept:
This site is a clone of theartstack.com, and it functions as a Pinterest-type site oriented toward sharing fine art.


#Features:




#Technologies:




#Todos:

- Stacks
- Follows
- Comments

- I am happy with the progress you all are making. Still I want to
keep reminding you to pick the features you implement according to
priority. It's easy to fall into the trap of spending large amounts of
time on very trivial features. Just because the site you are cloning
has a billion features, doesn't mean your app needs to do have them
too. Constantly think MVP. Right now your goal is to move most of your
app over to Backbone. From there you can indulge on adding little
features again.

- Have a guest account (or two, if you need both to demo). This will
save you time typing out username/password combos while demoing.
Employers won't take time to sign up for your site just to check it
out. Put a button on the homepage that signs them in directly as a demo user.

- When done with your app, create a tour for the guest account. This
demos extremely well. See this example of a student in a previous
cohort:
http://www.tourplanner.co/login

- Have buttons to fill out complex forms while demoing (with nice seed
data). Nobody wants to wait 5 minutes while you fill out "asdfsda" 20
times.

- Have a statement of 1-3 sentences on your homepage describing
your app ("A Tumblr clone", "A Rap Genius clone to annotate dolphin
sounds" etc.) Make it painfully obvious what your app does at first
glance. You do not have to be witty. Use a big font size. This will
look cool and be clear to employers with squirrel attention spans.

- It is very important when demoing your app that when you do actions,
like save, befriend, delete, modify, etc. something visually happens
on the page to acknowledge the action. This is important user feedback
and is crucial for any serious web app.

- Add flash messages to acknowledge saves, etc.

- Set up Sendgrid so your emails actually get sent and don't throw errors.

- Leverage your practice on the CSS assessment. Take this knowledge
and apply it to your final project. Feel free to copy the basic setup
and styles into your own app. You can modify and tweak it from there.

- Don't have any unstyled pages, no matter how insignificant the
page may be. It is more important to have a consistent design applied
everywhere, however minimal, than something fancy here and there, and
others painfully untouched.

- Make your overall text size big. Everything should be big. Your
project should demo well. Just pretend you're designing a billboard.

- Pick a sans-serif font.

- Style :hover actions of input, buttons and links, to show you can
click on things. More visual feedback!

- Style your input, textarea and button tags. Use the same size font,
color, etc. as the rest of your app, else they stick out like a sore
thumb.

- Use at least one external API to interface with. Google Maps (or
much better, Mapbox) and location aware posting is an easy feature to
tag on to most any app. Here are some resources to get you started:
https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation
http://www.rubygeocoder.com/
https://www.mapbox.com/

- Make sure to integrate Filepicker.io or Paperclip and AWS S3 for
uploading files and images. These links might help you:
https://github.com/appacademy/final-project-curriculum/blob/master/w8d4/filepicker.md
https://vimeo.com/groups/appacademy/videos/85222034
https://vimeo.com/groups/appacademy/videos/85222033
https://github.com/appacademy/final-project-curriculum/blob/master/w8d4/paperclip.md
https://github.com/jonathanlemuel/backbone-upload-demo

- If you haven't yet, make sure to add notifications to your app. This
will show feedback and results of actions. Think of Facebook
notifications for new comments, friend requests, etc. This translates
well to most apps (new annotations, new posts, etc.). It is a good
technological challenge and demos well. Go over the demo I made for
you the other day. You will need polymorphic associations. I will talk
about this next week, but here's a demo project to get you started,
poke around in it:
https://github.com/jonathanlemuel/notifications-demo/blob/master/app/models/notification.rb

- Add helpful tips of a sentence here and there on the spot in your
app to guide the user through your app. This makes your implemented
features extra obvious.

- Throughout the day ask other students to walk through your app, give
them instructions beforehand, and watch them do this on their own,
without help. See where they struggle to understand features. Return
this favor!

- Write a killer README.md covering concept, features, technologies
and a bunch of future todos (even if it's unlikely you'll ever do it,
it shows that you have thought about better ways to implement features,
etc.) Do this in Markdown. Practice writing Markdown. This is a good skill.

Here are some good examples of the previous class:
https://github.com/shubik22/BetterNote
https://github.com/andrewkv19/StreetEZ
https://github.com/jorgerro/treebnb

- Finally, remember your final project is to show off your technical
skills. Don't skimp on stuff you know well, but are bored of doing.
Write your own auth implementation.

- Go out of your way to use Omniauth, so people can sign in with
Facebook/Twitter/LinkedIn, etc. Almost all your apps could benefit of
this, it's easy to implement and demos well.

- Having inbound emails (using Sendgrid, Mandrill, etc.) is another
impressive win. Have a user be able to email a new wall post,
note, or whatever object applies to your app. Even better, use Twilio
to receive and send text messages. These are relatively easy APIs
which make for impressive demonstrations. We will demo this in class
in the next few days.

- Finally, keep your eyes open. Steal good ideas from alumni and aim
to make something even better. We're always raising the bar!
http://progress.appacademy.io/final_projects

You can do it. Continue making something amazing! Thanks for the
amazing laser cat t-shirt! I love it.

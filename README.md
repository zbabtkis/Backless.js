Backless.js
===========

*** A backendless database solution for your front end application. ***

Have you ever been working on a front end web application and wished you didn't have to write up a bunch of back end code just to get your front end code talking to your database?

Backless.js isn't for everyone. It's a scarily simple database system that has a built in user and group authentican system and customizable permission settings on every field.

Imagine you are writing a blog (oh great, you're thinking -- another blog tutorial).

Here's how it should work in an ideal world

```
socket.on('Post:New', function(post) {
  var html = template(post);
  
  $('#posts').append(html);
});

socket.emit('Post:Create', $('#post-form').serialize())
```

"So....", you're saying, "That's how I would write the front end bit normally."

Well that's where Backless.js comes in. With Backless, you're done. You don't even need to create the collection, because with the default configuration, Backless allows all database actions for anonymous clients.

So by writing just four lines of front-end javascript, we have a functional live blogging application. WTF! Right?

Obviously security is a huge concern here -- so read how that's solved below!

# Dashing Radiator View for Puppet
### Getting Started
#### Warning! Dashing does not play well with the current console webserver. I highly suggest hosting this dashing dashboard on a seperate server.
1.  `gem install dashing`
2.  `bundle install`
3.  Configure the three variables necessary for dashboard access. I highly suggest creating a new user with limited access for this. 
The three environment variables that need to be set are: `pup_host`, which is the hostname of your puppet master. `rad_user`, a user with radiator view access. `rad_password`, password for the `rad_user`. At the moment I am just exporting these values. I am sure there is room for improvement
4. dashing start

This is useful for those of us who want that pretty dashboard up without having to worry about creating a session and keeping it alive.

![A look at the dashboard](http://i.imgur.com/VvP1lzJ.png)

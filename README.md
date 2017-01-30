# Rails Templates

## Contents

* [Description](#description)
* [Overview](#overview)
* [Detailed Setup](#detailedsetup)

## Descritption

These are templates for quickly creating rails applications.


## Overview

To create a new rails app using this template, simply run:

`rails new app_name -T --database=postgresql -m ../rails_templates/rails_app_template.rb`


### Devise

To generate views, run:
`rails generate devise:views`

Code to create login:
```
-if user_signed_in? 
  p= "Logged in as <strong>" + current_user.email + "</strong>.".html_safe
  = link_to 'Edit profile', edit_user_registration_path  |
  = link_to "Logout", destroy_user_session_path, method: :delete 
-else 
  = link_to "Sign up", new_user_registration_path  |
  = link_to "Login", new_user_session_path 
```






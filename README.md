# OmniAuth Odnoklassniki.ru

This is the unofficial OmniAuth strategy for authenticating to Odnoklassniki.ru via OAuth.
To use it, you'll need to sign up for an [OAuth2](http://www.odnoklassniki.ru/devaccess) Application ID and Keys
on the [Odnoklassniki Developers Page](http://apiok.ru/wiki/pages/viewpage.action?pageId=42476652).

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :odnoklassniki, ENV['APP_ID'], ENV['APP_SECRET_KEY'], :public_key => ENV['APP_PUBLIC_KEY']
end
```

## Configuring
You can configure several options, which you pass in to the `provider` method via a `Hash`:

* `scope`: A list of permissions you want to request from the user. [Read the Odnoklassniki docs for more details](http://apiok.ru/wiki/pages/viewpage.action?pageId=42476652)

For example, to get `VALUABLE_ACCESS` permissions:

```ruby
use OmniAuth::Builder do
  provider :odnoklassniki, ENV['APP_ID'], ENV['APP_SECRET_KEY'], :public_key => ENV['APP_PUBLIC_KEY'],
    :scope => 'VALUABLE_ACCESS'
end
```

## Authentication Hash
Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{"provider"=>"odnoklassniki",
 "uid"=>"156210383106",
 "info"=>
  {"name"=>"Тимур Козьменко",
   "first_name"=>"Тимур",
   "last_name"=>"Козьменко",
   "image"=>"http://i500.mycdn.me/getImage?photoId=182400752898&photoType=4&viewToken=NdMoSjCY43Do55GMC9dcSw",
   "urls"=>{"Odnoklassniki"=>"http://www.odnoklassniki.ru/profile/156210383106"}},
 "credentials"=>
  {"token"=>"7.ipa228300y1o3o2ms683k5tsrvk16364", "refresh_token"=>"093ef4a51932db6e22834fb83eab95fdb83_156210383106_141603572", "expires_at"=>1416037593, "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"uid"=>"156210383106",
     "birthday"=>"1989-01-18",
     "age"=>25,
     "first_name"=>"Тимур",
     "last_name"=>"Козьменко",
     "name"=>"Тимур Козьменко",
     "locale"=>"ru",
     "gender"=>"male",
     "has_email"=>true,
     "location"=>{"city"=>"Владивосток", "country"=>"RUSSIAN_FEDERATION", "countryCode"=>"RU", "countryName"=>"Россия"},
     "current_status"=>"test test",
     "current_status_id"=>"527194803202",
     "current_status_date"=>"1970-01-01 03:00:00",
     "online"=>"web",
     "photo_id"=>"182400752898",
     "pic_1"=>"http://i500.mycdn.me/getImage?photoId=182400752898&photoType=4&viewToken=NdMoSjCY43Do55GMC9dcSw",
     "pic_2"=>"http://usd1.mycdn.me/getImage?photoId=182400752898&photoType=2&viewToken=NdMoSjCY43Do55GMC9dcSw"}}}
```

## License

Copyright (c) 2011 Alexander Logvinov.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

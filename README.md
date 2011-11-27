# OmniAuth Odnoklassniki.ru

This is the unofficial OmniAuth strategy for authenticating to Odnoklassniki.ru via OAuth.
To use it, you'll need to sign up for an [OAuth2](http://dev.odnoklassniki.ru/wiki/display/ok/The+OAuth+2.0+Protocol) Application ID and Keys
on the [Odnoklassniki Developers Page](http://dev.odnoklassniki.ru/wiki/pages/viewpage.action?pageId=13992188).

## Basic Usage

    use OmniAuth::Builder do
      provider :odnoklassniki, ENV['APP_ID'], ENV['APP_SECRET_KEY'], :public_key => ENV['APP_PUBLIC_KEY']
    end

## License

Copyright (c) 2011 Alexander Logvinov.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

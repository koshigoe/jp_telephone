# JpTelephone

日本国内の電話番号をパースします。
電話番号に関しては以下の情報を参考にしています。

  * [総務省｜電気通信番号の利用・指定｜電気通信番号指定状況](http://www.soumu.go.jp/main_sosiki/joho_tsusin/top/tel_number/number_shitei.html)

## Installation

Add this line to your application's Gemfile:

    gem 'jp_telephone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jp_telephone

## Usage

    require 'jp_telephone'
    
    # 固定電話
    tel = JpTelephone::Parser.new.parse('03-1234-5678')
    tel.parts   # => ['03', '1234', 5678]
    # 携帯電話
    tel = JpTelephone::Parser.new.parse('090-1234-5678')
    tel.parts   # => ['090', '123', 45678]
    tel.carrier # => 'ＫＤＤＩ'
    # 事業者識別番号
    tel = JpTelephone::Parser.new.parse('001-03-1234-5678')
    tel.parts   # => ['001', '03', '1234', 5678]
    tel.carrier # => 'ＫＤＤＩ'
    tel.number  # => an instance of JpTelephone::Number::Landline

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## See Also

  * [シンプル版](https://gist.github.com/3561413)
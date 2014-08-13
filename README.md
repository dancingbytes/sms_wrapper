# SmsWrapper

## Installation

Add this line to your application's Gemfile:

    gem 'sms_wrapper'

## Usage


    SMS.debug_on # SMS.debug_off
    SMS.turn_off if Rails.env.to_s != "production"

    SMS.gate IbateleSms, 'login', 'pass'
    SMS.gate SmsRu, 'login2', 'pass2', 'api_key'
    SMS.gate Sms24x7, 'login3', 'pass3'

    SMS.default SmsRu

  ## Send sms (gem choose gate automatically)

    SMS.message('79994447733', 'Hello World')

  ## or

    SMS.new(IbateleSms).message('79994447733', 'Hello World')
    SMS.new(IbateleSms).state('08766666')
    SMS.new(IbateleSms).balance


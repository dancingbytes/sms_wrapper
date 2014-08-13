# encoding: utf-8
require "sms_wrapper/version"
require "sms_wrapper/instance_methods"
require "sms_wrapper/class_methods"

module SmsWrapper

  class Base

    include ::SmsWrapper::InstanceMethods
    extend  ::SmsWrapper::ClassMethods

  end # Base

end # SmsWrapper

SMS = ::SmsWrapper::Base

# encoding: utf-8
module SmsWrapper

  module InstanceMethods

    def initialize(sms_class, silent = true)

      @active_gate = self.class.get(sms_class)

      raise "Gate not found by class #{sms_class}" if silent == false && !exist?

      manage_debug
      manage_turn_on
      login

    end # initialize

    def turn_on

      gate.send(:turn_on) if exist?
      self

    end # turn_on

    def turn_off

      gate.send(:turn_off) if exist?
      self

    end # turn_off

    def debug_on

      gate.send(:debug_on) if exist?
      self

    end # debug_on

    def debug_off

      gate.send(:debug_off) if exist?
      self

    end # debug_off

    def debug?
      exist? ? gate.send(:debug?) : false
    end # debug?

    def active?
      exist? ? gate.send(:active?) : false
    end # active?

    def login

      gate.send(:login, *@active_gate.args) if exist?
      self

    end # login

    def logout

      gate.send(:logout) if exist?
      self

    end # logout

    def message(*args)
      exist? ? gate.send(:message, *args) : nil
    end # message

    def state(msg_id)
      exist? ? gate.send(:state, msg_id) : nil
    end # state

    def balance
      exist? ? gate.send(:balance) : 0
    end # balance

    def error?(msg)
      exist? ? gate.send(:error?, msg) : false
    end # error?

    def name
      exist? ? @active_gate[:klass].to_s : ''
    end # name

    def exist?
      !@active_gate.nil?
    end # exist?

    private

    def gate

      return unless exist?
      @active_gate[:klass]

    end # gate

    def login

      gate.send(:login, *@active_gate[:args]) if exist?
      self

    end # login

    def manage_debug

      self.class.debug_on? ? self.debug_on : self.debug_off
      self

    end # manage_debug

    def manage_turn_on

      self.class.turn_on? ? self.turn_on : self.turn_off
      self

    end # manage_turn_on

  end # InstanceMethods

end # SmsWrapper

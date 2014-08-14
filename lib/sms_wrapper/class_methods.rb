# encoding: utf-8
module SmsWrapper

  module ClassMethods

    def gate(klass, *args)

      gates[klass.to_s] = {
        klass:  klass,
        args:   args
      }

      use_gate(klass) unless exists?
      self

    end # gate

    def default(klass)

      use_gate(klass)
      self

    end # default

    def get(klass)
      gates[klass.to_s]
    end # get

    def turn_on

      @active = true
      active_gate.turn_on if exists?
      self

    end # turn_on

    def turn_off

      @active = false
      active_gate.turn_off if exists?
      self

    end # turn_off

    def debug_on

      @debug = true
      active_gate.debug_on if exists?
      self

    end # debug_on

    def debug_off

      @debug = false
      active_gate.debug_off if exists?
      self

    end # debug_off

    def turn_on?
      @active === true
    end # turn_on?

    def debug_on?
      @debug === true
    end # debug_on?

    def message(*args)

      last_error = nil

      if exists?

        res = active_gate.send(:message, *args)

        if active_gate.error?(res)

          last_error = res
          puts "[SMS]. Ошибка при отправки сообщения (#{active_gate.name})"
          puts "[SMS]. #{res.inspect}"

        else
          return active_gate.name, res
        end # unless

      end # if

      gates.each do |klass, value|

        use_gate(klass)
        res = active_gate.send(:message, *args)

        if active_gate.error?(res)

          last_error = res
          puts "[SMS]. Ошибка при отправки сообщения (#{active_gate.name})"
          puts "[SMS]. #{res.inspect}"

        else
          return active_gate, res
        end # unless

      end # each

      return active_gate, last_error

    end # message

    def error?(req)
      exists? ? active_gate.error?(req) : req.is_a?(::StandardError)
    end # error?

    private

    def use_gate(klass)

      @active_gate.logout if @active_gate
      @active_gate = new(klass)
      self

    end # use_gate

    def exists?
      !@active_gate.nil?
    end # exists?

    def active_gate
      exists? ? @active_gate : nil
    end # active_gate

    def gates

      @gates ||= {}
      @gates

    end # gates

  end # ClassMethods

end # SmsWrapper

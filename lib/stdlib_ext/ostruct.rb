require 'ostruct'

class OpenStruct

  class << self

    def load_recursive(hash)
      new(hash.each_with_object({}) do |(k, v), memo|
        memo[k] = v.is_a?(Hash) ? load_recursive(v) : v.to_s.freeze
      end)
    end

  end

end

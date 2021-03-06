require "dry/view/context"

module DevoluteCodeChallenge
  class ViewContext < Dry::View::Context
    def csrf_token
      self[:csrf_token]
    end

    def csrf_metatag
      self[:csrf_metatag]
    end

    def csrf_tag
      self[:csrf_tag]
    end

    def flash
      self[:flash]
    end

    def flash?
      %i[notice alert].any? { |type| flash[type] }
    end

    private

    def [](name)
      _options.fetch(name)
    end
  end
end

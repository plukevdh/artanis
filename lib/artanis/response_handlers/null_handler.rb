module Artanis::ResponseHandlers
  class NullHandler
    def parse(data)
      data
    end
  end
end

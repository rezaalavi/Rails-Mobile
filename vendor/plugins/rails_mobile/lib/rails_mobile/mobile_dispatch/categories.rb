module MobileDispatch
  class Categories

    def self.add(&block)
      class << ActionDispatch::Routing::Mapper
        yield
      end
    end
  end
end
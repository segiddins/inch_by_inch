module InchByInch
  class ProgressEnumerable
    include Enumerable

    def initialize(array)
      @array = Array(array)
    end

    def each
      @array.each do |e|
        print '.'
        yield e
      end.tap { puts }
    end
  end
end

class Class
  def attr_accessor_with_history(*args)
    attr_init = args.map { |a| "@#{a.to_s}_history = [nil]" }.join(" ; ")
    class_eval %Q{
      def initialize
         #{attr_init}
      end
    }
    args.each do |arg|
      arg = arg.to_s
      attr_reader arg
      attr_reader "#{arg}_history"

      class_eval %Q{
        def #{arg}=(value)
          @#{arg} = value
          @#{arg}_history << value
        end
      }
    end
  end
end

class Foo
  attr_accessor_with_history :bar
end
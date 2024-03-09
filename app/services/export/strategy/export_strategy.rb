module Export
  module Strategy
    class ExportStrategy
      attr_accessor :user_id
      def initialize(user_id)
        @user_id = user_id
      end

      def execute
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
      end
    end
  end
end
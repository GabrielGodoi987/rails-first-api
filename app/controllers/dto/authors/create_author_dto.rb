module Dto
  module Authors
    class CreateAuthorDto
      def initialize(params)
        @params = params || {}
      end

      def to_h
        {
          name: normalize(:name),
          birth: normalize(:birth)
        }
      end

      private

      def normalize(key)
        return @params[key] if @params.key?(key)
        return @params[key.to_s] if @params.key?(key.to_s)
        nil
      end
    end
  end
end

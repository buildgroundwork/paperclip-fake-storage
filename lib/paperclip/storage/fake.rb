module Paperclip
  module Storage
    module Fake
      class << self
        def storage
          @storage ||= {}
        end
      end

      def exists?(style_name = default_style)
        storage[path(style_name)]
      end

      def flush_writes
        @queued_for_write.each do |style_name, file|
          storage[path(style_name)] = file
        end

        # after_flush_writes

        @queued_for_write = {}
      end

      def flush_deletes
        @queued_for_delete.each do |path|
          storage.delete(path)
        end
        @queued_for_delete = []
      end

      private

      def storage
        Fake.storage
      end
    end
  end
end


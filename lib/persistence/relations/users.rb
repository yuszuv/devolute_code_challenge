module Persistence
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users, infer: true)

      def by_id(id)
        where(id: id)
      end

      def by_username(username)
        where(username: username)
      end

    end
  end
end

# typed: true

class ActiveRecord::Base
  include ActiveStorage::Attached::Model
end

class ActiveRecord::Relation
  include ::ActiveRecord::SignedId::ClassMethods
end

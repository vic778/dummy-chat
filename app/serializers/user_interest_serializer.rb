class UserInterestSerializer < ActiveModel::Serializer
  attributes :id, :interest_name, :profile_id, :sub_interests
end

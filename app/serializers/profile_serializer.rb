class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :user_id, :date_of_birth, :country,
             :avatar_url, :video_url
end

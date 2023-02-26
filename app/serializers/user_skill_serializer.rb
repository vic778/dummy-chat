class UserSkillSerializer < ActiveModel::Serializer
  attributes :id, :skill_name, :profile_id, :sub_skills
end

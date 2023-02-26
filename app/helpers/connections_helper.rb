module ConnectionsHelper    
  def get_requestee_profile(id)
    Profile.find_by(user_id: id)
    UserInterest.find_by(profile_id: id)
    UserSkill.find_by(profile_id: id)
  end



end

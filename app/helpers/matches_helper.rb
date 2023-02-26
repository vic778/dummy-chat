module MatchesHelper 
	def match(interest)
		profiles = []

		Profile.all.each do |profile|
			profiles << profile if has_interest?(interest,profile) && profile.id != current_user.profile.id
		end

    profiles
		sort_profiles(profiles)

	end

	def has_interest?(interest,profile)
		interests = build_interests(profile)
		if(interests.include?(interest))
			return true
		else
			return false
		end
	end

	def build_interests(profile)
		interests = []
		profile.user_interests.each{ |ui| interests << ui.interest_name.downcase }
		interests
	end

	def generate_skill_set(skills)
		skill_set = Hash.new()

		Skill.all.each do |skill|
      skill_set["#{skill.name}".downcase] = {profiles: [], indicator: skill.indicator}
		end

		skill_set
	end

	def sort_profiles(profiles)
		skills = Skill.all

		talents = generate_skill_set(skills)
		companies = generate_skill_set(skills)
		investors = generate_skill_set(skills)


		talents.each do |key,value|
			talents[key][:profiles] += profiles.select { |p| p.user_skills.first.skill_name.downcase == key && p.profile_role.role_id == 1}
		end

		companies.each do |key,value|
			companies[key][:profiles] += profiles.select { |p| p.user_skills.first.skill_name.downcase  == key && p.profile_role.role_id == 2}
		end

		investors.each do |key,value|
			investors[key][:profiles] += profiles.select { |p| p.user_skills.first.skill_name.downcase  == key && p.profile_role.role_id == 3}
		end
    
		return {talents: talents, companies: companies, investors: investors}
	end
end
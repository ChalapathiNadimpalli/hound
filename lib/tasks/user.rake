namespace :dev do
  
  desc 'Add role to a user'
  # rake dev:set_user_role["ChalapathiNadimpalli", "admin"]
  task :set_user_role, [:username, 'role'] => :environment do |t, args|
    set_role_to_user(args[:username], args[:role])
  end


  def set_role_to_user(username, user_role)
    user = User.where(username: username).first
    if user.blank?
      puts 'User not found'
      return
    end
    user.role = user_role
    user.save
    puts 'Role added successfully'
  end
end

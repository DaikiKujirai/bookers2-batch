namespace :dmail do
  desc "dmail"
  task dmail: :environment do
    UserMailer.daily.delver
  end
end
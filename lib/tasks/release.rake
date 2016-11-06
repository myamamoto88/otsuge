namespace :release do
  desc 'release the announces'
  task announces: :environment do
    AnnounceService.run
  end
end

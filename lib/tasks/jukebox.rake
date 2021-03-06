namespace :jukebox do
    desc 'resets Jukebox database'
    task :reset  => [:"db:reset", :"db:migrate"] do
      Dir[JUKEBOX_MUSIC_FILES].each do |file|
        PlaylistEntry.create! :file_location => file
      end
    end
end


class PlaylistEntry < ActiveRecord::Base
  UNPLAYED = "unplayed"
  PLAYING = "playing"

  SUPPORTED_FORMATS = %w[
    mp3
    m4a
  ]

  def self.playing_track
    find_by_status(PlaylistEntry::PLAYING)
  end

  def self.find_ready_to_play
    where(:status => UNPLAYED).order(:id).first
  end

  def self.find_all_ready_to_play
    where(:status => UNPLAYED).order(:id)
  end

  def self.find_next_track_to_play
    track = find_ready_to_play
    return track unless track.nil?
    return false unless PlayerStatus.continuous_play?
    create_random!
    find_ready_to_play
  end

  def self.create_random!(params = {})
    users = []
    Dir["#{JUKEBOX_MUSIC_ROOT}/*"].each do |file|
      File.directory? file or next
      users << file
    end

    users.each do |user_path|
      filemask = File.join(user_path, "**", "*.mp3")
      mp3_files = []
      Dir[filemask].each do |file|
        next if file.nil?
        next if File.directory? file
        mp3_files << file
      end
      next if mp3_files.empty?
      create! :file_location => mp3_files[rand(mp3_files.size)]
    end
  end

  def self.skip(track_id)
    find(track_id).update_attributes! :skip => true
  end

  def filename
    self.file_location.split('/').last
  end

  def contributor
    file_location.sub(JUKEBOX_MUSIC_ROOT, "").split('/')[1].titlecase
  end


  begin # ID3 Tag Methods
    def id3_tag
      require 'audioinfo'
      @id3 ||= AudioInfo.open(file_location)
    end

    def tag_property name
      id3_tag.send name if name.is_a? Symbol
    end

    def title
      tag_property :title
    end

    def artist
      tag_property :artist
    end

    def album
      tag_property :album
    end

    def track_number
      tag_property :track_number
    end

    def to_s
      "#{file_location} / #{artist} - <span style='font-style: italic; vertical-align: top'>#{title}</span>"
    end
  end

end


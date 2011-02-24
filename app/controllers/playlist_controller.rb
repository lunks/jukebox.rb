class PlaylistController < ApplicationController

#   before_filter  :redirect_to_root, :except=> [:browse, :search, :index, :status, :skip_requested, :toggle_continuous_play, :next_hammertime]
#
#   def redirect_to_root
#     redirect_to (:back) and return
#   end


  def add_random
    PlaylistEntry.create_random!(:number_to_create => params[:number_to_create] || 1)
    render :action => :index
  end

  def add_track
    PlaylistEntry.create! :file_location => File.join(JUKEBOX_MUSIC_ROOT, params[:filepath])
  end

  def add_for
    PlaylistEntry.create_random!(:user => params[:name])
  end

  def browse

  end

  def delete
    PlaylistEntry.delete(params[:id])
    render :action => :index
  end

  def pause
    PlayerStatus.pause
    #redirect_to root_url
    render :action => :index
  end

  def play
    PlayerStatus.play
    #redirect_to root_url
    render :action => :index
  end

  def search
  end

  def index
  end

  def skip
    PlaylistEntry.skip(params[:id])
    render :action => :index
  end

  def status
     render :text => PlayerStatus.status

  end

  def skip_requested
    current_track = PlaylistEntry.playing_track
    skip = current_track.nil? ? false : current_track.skip

    render :text => skip.to_s
  end

  def next_entry
    PlaylistEntry.find_all_by_status(PlaylistEntry::PLAYING).each { |p| PlaylistEntry.delete(p) }
    filename = ""
    if entry = PlaylistEntry.find_next_track_to_play
      entry.update_attributes!(:status => PlaylistEntry::PLAYING)
      filename = entry.file_location
    end

    render :text => filename
  end

  def toggle_continuous_play
    PlayerStatus.toggle_continuous_play

    render :nothing => true
  end

  def next_hammertime
    text = ""
    if hammertime = Hammertime.first
      text = [hammertime.snippet.file_location,
              hammertime.snippet.start_time,
              hammertime.snippet.end_time,
              hammertime.after].join('|')
      Hammertime.delete(hammertime)
    end

    render :text => text
  end


end


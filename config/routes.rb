JukeboxRb::Application.routes.draw do

  #map.playlist_status '/playlist/status', :controller => 'playlist', :action => 'status'
  match 'playlist/status' => 'playlist#status', :as => :playlist_status


  #match 'browse', :to => 'playlist#browse'
  root :to => "playlist#index"

  match 'playlist/toogle_continuous_play' => 'playlist#toogle_continuous_play', :as => :playlist_toggle_continuous_play
  match 'playlist/pause' => 'playlist#pause', :as => :playlist_pause
  match 'playlist/play' => 'playlist#play', :as => :playlist_play
  match 'playlist/skip(/:id)' => 'playlist#skip', :as => :playlist_skip
  match 'playlist/add_random(/:number_to_create)' => 'playlist#add_random', :as => :playlist_add_random
  match 'browse' => 'playlist#browse', :as => :browse
  match 'playlist/delete' => 'playlist#delete', :as => :playlist_delete
  match 'playlist/add_track' => 'playlist#add_track', :as => :playlist_add_track

  #map.playlist_next_hammertime '/playlist/next_hammertime', :controller => 'playlist', :action => 'next_hammertime'
  match 'playlist/next_hammertime' => 'playlist#next_hammertime', :as => :playlist_next_hammertime
  #map.playlist_next_entry '/playlist/next_entry', :controller => 'playlist', :action => 'next_entry'
  match 'playlist/next_entry' => 'playlist#next_entry', :as => :playlist_next_entry
  #map.playlist_skip '/playlist/skip/:id', :controller => 'playlist', :action => 'skip'
  match 'playlist/skip_requested' => 'playlist#skip_requested', :as => :playlist_skip_requested
  #map.playlist '/playlist', :controller => 'playlist', :action => 'index'
  #match 'playlist' => 'playlist', :as => :index

  resources :playlist do

  end



  #match ':controller(/:action(/:id))'

  #map.playlist_add_random_number '/playlist/add_random/:number_to_create', :controller => 'playlist', :action => 'add_random'
  #map.playlist_add_random '/playlist/add_random', :controller => 'playlist', :action => 'add_random'
  #map.playlist_add_track '/playlist/add_track', :controller => 'playlist', :action => 'add_track'
  #map.playlist_add_for '/playlist/add_for/:name', :controller => 'playlist', :action => 'add_for'
  #map.playlist_delete '/playlist/delete/:id', :controller => 'playlist', :action => 'delete'
  #map.playlist_play '/playlist/play', :controller => 'playlist', :action => 'play'
  #map.playlist_pause '/playlist/pause', :controller => 'playlist', :action => 'pause'
  #map.playlist_toggle_continuous_play '/playlist/toggle_continuous_play', :controller => 'playlist', :action => 'toggle_continuous_play'
  #map.playlist_skip_requested '/playlist/skip_requested', :controller => 'playlist', :action => 'skip_requested'
  #map.browse '/browse', :controller => 'playlist', :action => 'browse'
  #map.search '/playlist/search', :controller => 'playlist', :action => 'search'
  #map.hammertime_add_for '/hammertime/add_for/:name', :controller => 'hammertime', :action => 'add_for'
  #map.user_activate '/user/activate/:username', :controller => 'user', :action => 'activate'
  #map.user_inactivate '/user/inactivate/:username', :controller => 'user', :action => 'inactivate'
  #map.user_show '/user', :controller => 'user', :action => 'index'

end


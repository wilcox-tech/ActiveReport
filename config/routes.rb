ActiveReport::Engine.routes.draw do
  resources :reports, :only => [ :index, :show ], :module => 'ActiveReport',
                      :path => '/'
end

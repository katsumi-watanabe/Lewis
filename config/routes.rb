Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'user/users/sessions',
    passwords: 'user/users/passwords',
    registrations: 'user/users/registrations'
  }

  devise_for :admins, controllers: {
   sessions: 'admin/admins/sessions',
   passwords: 'admin/admins/passwords',
   registrations: 'admin/admins/registrations'
  }

  root to: 'user/homes#top'
end
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :show, :edit, :destroy, :update, :index] do
    resources :comments, only: [:create, :destroy] do
      resources :favorites, only: [:create, :destroy]
      # favoriteの対象がcommentの時は特定のcommentのidが必要なのでbooksにネストする
    end
    resources :favorites, only: [:create, :destroy]
    # favoriteの対象がbookの時は特定のbookのidが必要なのでbooksにネストする
  end
  resources :users, only: [:show, :index, :edit, :update] do
    get :favorited_book_list, on: :member
    get :favorited_comment_list, on: :member
    resource :relationships, only: [:create, :destroy]
    # 1ユーザーに対してつけられるフォローは１なのでrelationshipの特定のためのidを持たせる必要はなく、resouceでOK
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' =>'relationships#followers', as: 'followers'
  end
end

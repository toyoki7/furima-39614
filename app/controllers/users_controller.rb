class UsersController < ApplicationController
  validates :nickname, presence: true
end

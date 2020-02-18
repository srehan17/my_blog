# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, dependent: :destroy
  has_many :pictures
end

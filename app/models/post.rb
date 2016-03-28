class Post < ActiveRecord::Base
	belongs_to :bulletin
	has_many :post_attachments, :dependent => :destroy
	has_many :videos, :dependent => :destroy
	accepts_nested_attributes_for :post_attachments
	accepts_nested_attributes_for :videos
end

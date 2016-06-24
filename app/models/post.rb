class Post < ActiveRecord::Base
	belongs_to :bulletin
	has_many :post_attachments, :dependent => :destroy
	has_many :videos, :dependent => :destroy
	accepts_nested_attributes_for :post_attachments
	accepts_nested_attributes_for :videos

	def next_id
		next_post = self.bulletin.posts.where("id > ?", self.id).first
		unless next_post.blank?
			return next_post.id
		else
			next_bulletin_id = self.bulletin.next_id
			return Bulletin.find(next_bulletin_id).posts.first.id
		end
	end

	def prev_id
		prev_post = self.bulletin.posts.where("id < ?", self.id).last
		unless prev_post.blank?
			return prev_post.id
		else
			prev_bulletin_id = self.bulletin.prev_id
			return Bulletin.find(prev_bulletin_id).posts.last.id
		end
	end
end

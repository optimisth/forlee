class Bulletin < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	belongs_to :list

	def next_id
		next_bulletin = self.list.bulletins.where("id > ?", self.id).first
		unless next_bulletin.blank?
			return next_bulletin.id
		else
			next_list_id = List.where("id > ?", self.list.id).order("id ASC").first || List.first
			return List.find(next_list_id).bulletins.first.id
		end
	end

	def prev_id
		prev_bulletin = self.list.bulletins.where("id < ?", self.id).last
		unless prev_bulletin.blank?
			return prev_bulletin.id
		else
			prev_list_id = List.where("id < ?", self.list.id).last || List.last
			return List.find(prev_list_id).bulletins.last.id
		end
	end
end

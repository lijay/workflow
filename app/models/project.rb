class Project < ActiveRecord::Base
	has_many :steps
	validates :title, :presence =>  { :message => "不可空白" }
	after_create :default_steps

	belongs_to :owner, :class_name => "User", :foreign_key => :user_id


	def default_steps
		8.times do |n|
			step = steps.build()
			step.no = n+1
			step.name = "Step#{step.no}"
			step.finished = false
			step.save

			3.times do |i|
				item = step.items.build()
				item.summary = "item#{i+1}"
				item.save
			end
		end
	end

	def editable_by?(user)
		user && user == owner
	end
end

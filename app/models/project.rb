class Project < ActiveRecord::Base
	has_many :steps
	validates :title, :presence =>  { :message => "不可空白" }
end

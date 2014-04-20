class Step < ActiveRecord::Base
	belongs_to :project
	has_many :items
	validates :name, :presence => { :message => "欄位不可空白" }
end

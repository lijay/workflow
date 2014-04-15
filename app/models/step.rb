class Step < ActiveRecord::Base
	belongs_to :project
	validates :name, :presence => { :message => "欄位不可空白" }
end

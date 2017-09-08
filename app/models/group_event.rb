class GroupEvent < ApplicationRecord
	validates_presence_of :name, :if=> lambda { self.published? }
	validates_presence_of :description, :if=> lambda { self.published? }
	validates_presence_of :start, :if=> lambda { self.published? }
	validates_presence_of :end, :if=> lambda { self.published? }
	validates_presence_of :duration, :if=> lambda { self.published? }
	default_scope { where(is_deleted: false) }
	after_save :set_duration


	def set_duration
		if start.present? and self.end.present?
			duration = (self.end.to_i - self.start.to_i)/1.day
			self.update_column(:duration,  duration)
		elsif start.present? and self.duration.present?
			end_date = self.start+self.self.duration.to_i.day
			self.update_column(:end, end_date)
		elsif self.end.present? and self.duration.present?
			start = self.end - self.duration
			self.update_column(:start,  start)
		elsif self.duration.present?
			self.start = Time.now
			end_date = Time.now + self.duration.to_i.day
			self.update_column(:end, end_date)
		end			
	end
end

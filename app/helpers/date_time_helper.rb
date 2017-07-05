module DateTimeHelper
	def event_date(date)
	  	date.to_formatted_s(:long_ordinal)
	end

	def event_time(time)
		time.strftime("%I:%M %P")
	end
end
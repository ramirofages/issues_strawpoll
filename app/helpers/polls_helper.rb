module PollsHelper

	def duration_initial_value(poll)
		if(poll.persisted?)
			(@poll.expiration_date - Date.today).to_i
		else
			1
		end
	end

	def poll_ends_in(poll)
		remaining_time = (poll.expiration_date - Date.today).to_i
		(remaining_time > 0) ? remaining_time.to_s+' days' : "ended"
	end

	def can_vote?(poll)
		if not user_signed_in?
			true
		else
			can? :vote, poll
		end
	end
end

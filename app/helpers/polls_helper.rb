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
		(poll.accept_votes?) ? remaining_time.to_s+' days' : "ended"
	end

	def can_vote?(poll)
		if not user_signed_in?
			poll.accept_votes?
		else
			can?(:vote, poll) and poll.accept_votes?
		end
	end
end

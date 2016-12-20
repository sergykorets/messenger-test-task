module ConversationsHelper

	def other_user_names(conversation)

	    users = []
	    conversation.messages.map(&:receipts).each do |receipts|
	        users << receipts.select do |receipt|
	            receipt.receiver != current_user
	        end.map(&:receiver)
	    end
	    users.flatten.uniq.map(&:name).join ', '
	end

	def other_user_avatar(conversation)
		# get all users (no duplicates)
		users = []
	    conversation.messages.map(&:receipts).each do |receipts|
	        users << receipts.select do |receipt|
	            receipt.receiver != current_user
	        end.map(&:receiver)
	    end
	    return users[0][0]
	end

end

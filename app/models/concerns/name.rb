module Name
	extend ActiveSupport::Concern

	def fullname
    firstname + " " + lastname
    end

end
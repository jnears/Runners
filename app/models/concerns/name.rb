module Name
	extend ActiveSupport::Concern

	def fullname
    firstname + " " + lastname
    	"#{firstname} #{lastname}"
    end

end
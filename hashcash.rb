require 'digest'
require 'securerandom'

class HashCash
	def initialize
		@given_string = SecureRandom.base64
	end

	def find_string
		loop do
			digest = Digest::SHA1.hexdigest @given_string + SecureRandom.base64
			return digest if digest[0..4] == "00000"
		end
	end
end

h_c = HashCash.new
p h_c.find_string
class Contact < ActiveRecord::Base

def valid_phone?
  phone.to_i != 0 && phone.length == 9 ? true : false
end

def valid_email?
  email.split('@').length == 2 && email.split('.').length == 2 ? true : false
end

end

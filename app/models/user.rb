class User < ActiveRecord::Base
  validates :email, presence :true, uniqueness :true
  validates :password presence :true
  validates_format_of :email, :with => /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{1,4})+$/

end


User Model

You have an empty User model and a database with a users table. Add validations to the User model which guarantee the following:

Every user has an email
Every user's email is unique
Every email looks like * @ *.*
Every user has a password
You should not store the user's password directly in the database.
# From the Rails console use:
# > load '../scripts/db-password-reset.rb'

User.all().each { |u| u.password = 'password'; u.save(); }
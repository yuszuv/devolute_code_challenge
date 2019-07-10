Factory.define :user do |f|
  f.sequence(:username) { |i| "user-#{i}" }
  f.encrypted_password { fake(:lorem, :words, 1) }
end


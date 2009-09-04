
Factory.define :user do |f|
  f.sequence(:username) { |n| "foo#{n}" }
  f.password {|u| u.username}
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :question do |f|
  f.sequence(:name) {|n| "question#{n}"}
  f.sequence(:group) {|n| "group#{n}"}
end

Factory.define :answer do |f|
  f.sequence(:value) {|n| "value#{n}" }
end
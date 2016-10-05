# frozen_string_literal: true
FactoryGirl.define do
 factory :user do
   first_name "Chris"
   last_name "Serpa"
   email "cserpa123@gmail.com"
   password "devise"
 end

 factory :figure do
   name "Abraham Lincoln"
   occupation "President"
   nationality "American"
   era "1800s"
   claim_to_fame "Freed the slaves"
 end
end
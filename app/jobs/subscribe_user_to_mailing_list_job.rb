class SubscribeUserToMailingListJob < ApplicationJob
  queue_as :default

  def perform(email)
    gb = Gibbon::Request.new

    list_id = ENV["MAILCHIMP_LIST_ID"]

    gb.lists(list_id)
      .members
      .create(body: { email_address: email, status: "subscribed"})
  end
end
# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  git_url     :string
#  description :string
#  demo_url    :string
#  author_name :string
#  name        :string
#  caption     :string
#  twitter_id  :string
#  approved    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :user
  acts_as_votable

  def toggle_like(user)
    if voted_on_by? user
      unliked_by user
    else
      liked_by user
    end
  end
end

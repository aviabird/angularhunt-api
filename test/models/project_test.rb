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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

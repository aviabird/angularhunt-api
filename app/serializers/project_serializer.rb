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

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :git_url, :description, :demo_url,
             :author_name, :name, :caption, :twitter_id, 
             :approved, :created_at, :image_url,
             :is_liked_by_current_user, :project_likes_count,


  def image_url
    object.image_url ? object.image_url : "http://www.adweek.com/core/wp-content/uploads/files/news_article/project-isaac-hed-2013_0.jpg"
  end

  def is_liked_by_current_user
    return false unless current_user
    object.voted_on_by? current_user    
  end

  def project_likes_count
    object.get_likes.count
  end
end

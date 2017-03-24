# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#  google                 :string
#  display_name           :string
#  image_url              :string
#  first_name             :string
#  last_name              :string
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :display_name, 
             :first_name, :last_name, :image_url

  def display_name
    "#{first_name last_name}" 
  end

end

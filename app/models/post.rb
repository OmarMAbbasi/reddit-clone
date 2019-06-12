# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord


  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :xposts,
    foreign_key: :post_id,
    class_name: :PostSub,
    inverse_of: :post

  has_many :subs,
    through: :xposts,
    source: :sub

  
end

# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  post_id    :integer
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord

  belongs_to :post,
    foreign_key: :post_id,
    class_name: :Post,
    inverse_of: :xposts

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub,
    inverse_of: :postscrossed

end

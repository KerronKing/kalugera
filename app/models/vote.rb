class Vote < ApplicationRecord
  belongs_to :userid
  belongs_to :articleid
end

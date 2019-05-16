class Address < ApplicationRecord
  enum status: { current: 1, permanent: 2 }
  acts_as_favoritable
end

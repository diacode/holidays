class UserSerializer < ActiveModel::Serializer
  attributes  :id,
              :email,
              :admin,
              :full_name
end

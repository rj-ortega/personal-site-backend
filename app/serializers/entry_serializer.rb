class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :message

  attribute :user_name do |entry|
    "#{entry.user.name}"
  end

  belongs_to :user
end

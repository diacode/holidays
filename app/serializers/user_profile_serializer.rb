
class UserProfileSerializer < UserSerializer
  attributes  :id,
              :email,
              :admin,
              :full_name,
              :on_holidays,
              :available_days,
              :current_year_days_spent,
              :avatar_url,
              :granted_days,
              :requested_approved_days

  def granted_days
    object.granted_vacation_days.group(:year).count
  end

  def requested_approved_days
    object.requested_days.approved.reorder(day: :desc)
  end
end

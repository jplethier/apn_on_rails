class APN::PullNotification < APN::Base
  belongs_to :app, :class_name => 'APN::App'

  validates_presence_of :app_id

  def self.latest_since(app_id, since_date=nil)
    if since_date
      res = order("created_at DESC").where("app_id = ? AND created_at > ? AND launch_notification = ?", app_id, since_date, false).first
    else
      res = order("created_at DESC").where("app_id = ? AND launch_notification = ?", app_id, true).first
      res = .order("created_at DESC").where("app_id = ? AND launch_notification = ?", app_id, false) unless res
    end
    res
  end

  def self.all_since(app_id, since_date=nil)
    if since_date
      res = order("created_at DESC").where("app_id = ? AND created_at > ? AND launch_notification = ?", app_id, since_date, false).all
    else
      res = order("created_at DESC").where("app_id = ? AND launch_notification = ?", app_id, false)
    end
  end
end
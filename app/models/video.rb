class Video < Couchbase::Model
  attribute :status
  attribute :filename
  attribute :repo
  attribute :created_at

  FAILED = 'failed'
  READY = 'ready'

  STATUSES = [FAILED, READY]

  def repo_path
    "public/system/repos/#{id}"
  end

  def src_path
    "/system/repos/#{id}/gource.webm"
  end

  def change_status!(new_status)
    self.status = new_status if STATUSES.include?(new_status.to_s)
    save
  end

  def is?(check_status)
    status == check_status
  end
end

class Video < Couchbase::Model
  attribute :status
  attribute :filename
  attribute :repo

  def repo_path
    "public/system/repos/#{id}"
  end
end

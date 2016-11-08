class Subdomain
  RESERVED_NAMES = %w(www http https ftp sftp ssl ns mx pop smtp admin mail users).freeze

  def self.matches?(request)
    request.subdomain.present? && !RESERVED_NAMES.include?(request.subdomain)
  end
end

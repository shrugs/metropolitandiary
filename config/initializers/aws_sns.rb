class SNS
  include Singleton

  def initialize
    @sns = Aws::SNS::Client.new
  end

  def method_missing(method, *args, &block)
    @sns.send(method, *args, &block)
  end
end
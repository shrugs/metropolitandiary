class Device < ApplicationRecord
  belongs_to :user

  after_create :register_with_sns

  def publish_message(message = {})
    message = SNS.instance.publish(
      target_arn: endpoint_arn,
      message: message.to_json,
      message_structure: 'json'
    )
  end

  def publish_simple_message(message = "Test Message, Please Ignore")
    apns_message = {
      aps: {
        alert: message,
        sound: 'default',
        },
    }.to_json
    publish_message({
      default: message,
      APNS_SANDBOX: apns_message,
      APNS: apns_message,
    })
  end

  def publish_entry(entry)
    return unless entry

    apns_message = {
      aps: {
        alert: entry.title,
        sound: 'default',
        badge: 1,
        extra: {
          entry_id: entry.id.to_s
        },
      },
    }.to_json
    publish_message({
      default: entry.title,
      APNS_SANDBOX: apns_message,
      APNS: apns_message,
    })
  end

  private

  def register_with_sns
    endpoint = SNS.instance.create_platform_endpoint(
      platform_application_arn: ENV['SNS_APNS_PLATFORM_APPLICATION_ARN'],
      token: device_token,
      attributes: {
        'UserId' => user.id.to_s,
        'ChannelId' => device_token,
      }
    )
    self.endpoint_arn = endpoint[:endpoint_arn]
    self.save
  end
end

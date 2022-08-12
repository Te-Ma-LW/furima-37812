class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 0, scheduled_delivery: '---' },
    { id: 1, scheduled_delivery: '1~2日で発送' },
    { id: 2, scheduled_delivery: '2~3日で発送' },
    { id: 3, scheduled_delivery: '4~7日で発送' }
  ]
end
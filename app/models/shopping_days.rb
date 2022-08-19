class ShoppingDays < ActiveHash::Base
  self.data = [
    { id: 0, shopping_days: '---' },
    { id: 1, shopping_days: '1~2日で発送' },
    { id: 2, shopping_days: '2~3日で発送' },
    { id: 3, shopping_days: '4~7日で発送' }
  ]
end

class Limit < ActiveHash::Base
 self.data = [
   { id: 1, name: '---' },
   { id: 2, name: 'あり' },
   { id: 3, name: 'なし' }
 ]

  include ActiveHash::Associations
  has_many :items
  has_many :states

 end
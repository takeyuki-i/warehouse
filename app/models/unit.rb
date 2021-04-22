class Unit < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '個' },
    { id: 3, name: '台' },
    { id: 4, name: '枚' },
    { id: 5, name: 'セット' },
    { id: 6, name: '本' },
    { id: 7, name: '冊' },
  ]

   include ActiveHash::Associations
   has_many :states

end

User.destroy_all

tom   = User.create!(name: 'Tom',    password: '123123123', email: 'tom@futureworkz.com')
wayne = User.create!(name: 'Wayne',  password: '123123123', email: 'wayne@futureworkz.com')
james = User.create!(name: 'James',  password: '123123123', email: 'james@futureworkz.com')


initial_comment       = Comment.create!(    message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: tom)
first_tier_comments   = Comment.create!([{  message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: wayne, parent: initial_comment },             { message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: james, parent: initial_comment } ])
second_tier_comments  = Comment.create!([{  message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: tom,   parent: first_tier_comments.first },   { message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: tom,   parent: first_tier_comments.second } ])
third_tier_comments   = Comment.create!([{  message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: wayne, parent: second_tier_comments.first },  { message: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', user: james, parent: second_tier_comments.second } ])

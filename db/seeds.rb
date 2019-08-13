puts 'Cleaning database...'

Teddy.destroy_all

puts 'Creating teddies...'
Teddy.create!(price_cents: 1, sku: 'original-teddy-bear', name: 'Teddy bear', photo_url: 'http://onehdwallpaper.com/wp-content/uploads/2015/07/Teddy-Bears-HD-Images.jpg')
Teddy.create!(price_cents: 1, sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large')
Teddy.create!(price_cents: 1, sku: 'octocat',   name: 'Octocat -  GitHub', photo_url: 'https://cdn.thenewstack.io/media/2014/11/githubfigurine-1024x539.jpg')
puts 'Finished!'

5.times do |n|
  Post.create!(
      title: "title#{n + 1}",
  )
end
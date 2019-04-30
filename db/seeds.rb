# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "fooooooobar",
             password_confirmation: "fooooooobar",
             activated: true,
             activated_at: Time.zone.now)

users = User.order(:created_at).take(1)
50.times do
  title = "Document Title"
  content = "1)	Ad hominem – My experience with ad hominem came from watching Donald Trump during the 2016 Presidential election. Whenever he said something about the opposition, he would personally attack that person. Flash forward to today and he still attacks people on twitter and on television. Donald Trump almost always uses ad hominem.

2)	Appeal to Tradition – I have experienced this fallacy when it comes to people who are pro firearms. People think that because the right to bear arms was written in the constitution that it must remain there forever, and that Americans must have the right to purchase firearms. It’s really sad when we constantly hear about individuals going into public places and causing great harm all because “it’s an American right”.

3)	Blind Loyalty – I have experienced this fallacy again through the 2016 Presidential elections and today with Donald Trump. It seems that the majority of Donald Trump supports are just blindly supporting him no matter what he says or does. Donald Trump promised his supporters that Mexico was going to pay for the border wall that he wanted to build if he became President. He became President and then shut down the government, the longest shutdown to date because congress wouldn’t give him the money to build the wall. That is just one example of the many lies Donald Trump has publicly said. Trump supporters are blindly loyal to him even though he has consistently lied to them.

4)	Argumentum ad Baculam – My experience with this fallacy is again with Donald Trump. Last year he wrote in a twitter post, “will someone from his [Kim Jung Un] depleted and food starved regime please inform him that I too have a Nuclear Button, but it is a much bigger & more powerful on than his, and my Button works!” in reference to the nuclear missile launch button. I’m not entirely sure what Donald Trump was trying to persuade North Korea to do but I don’t think that was the best strategy.

5)	Big Lie Technique – I think that this is the cause of most of if not all conspiracy theories. A specific conspiracy theory comes to mind though which is the flat earth conspiracy. It seems that people who believe the earth is flat are just broadcasting their belief on the internet with no evidence to back their claims. With the internet making the sharing of information possible, even if it’s not proven legitimate, it seems that the flat earth conspiracy is picking up more and more support."
  users.each { |user| user.documents.create!(content: content, title: title) }
end

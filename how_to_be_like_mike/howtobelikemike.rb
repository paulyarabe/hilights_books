require 'pry'

book_notes = ["“The thing that makes Michael who he is,” he said, “is his focus. His ability to concentrate absolutely. To set everything else aside other than what needs to be done right now.”\\n\\nApril 28, 2019", "It is a mistake to look too far ahead. Only one link in the chain of destiny can be handled at a time. —Winston Churchill\\n\\nApril 28, 2019", "When I coached, I’d say to the players, “Yes, I know you played hard, but that’s not good enough. You’ve got to stay focused on the task at hand the entire game.” —Rick Barry\\n\\nApril 28, 2019", "Jordan had no tolerance for lapses—from teammates, from coaches, from anyone. He understood the detriment, even the danger, of divided focus.\\n\\nApril 28, 2019", "If you chase two rabbits, both will escape. —Ancient Proverb\\n\\nApril 28, 2019", "The truth is, focus begins with recognition. Of where you are. Of what can be controlled. Of the moments in which we live, and the moments that we can affect. It begins with today. That’s what author Barbara Sher meant when she wrote. “Now is the operative word. Everything you put in your way is just another method of putting off the hour when you could actually be doing your dream. You don’t need endless time and perfect conditions. Do it now. Do it today. Do it for twenty minutes and watch your heart start beating!”\\n\\nApril 28, 2019", "“When I did lose the appetite to prove myself again and again,” Michael said, “I started tricking myself. I had to create situations to stay on top.”\\n\\nApril 28, 2019", "Baseball, it would seem, was a failure. Jordan never progressed past the Double-A level with the Chicago White Sox. He struggled to hit professional pitching. He barely managed to keep his average above the . 200 level in 1994. This was an athlete we were not accustomed to seeing fail, and being at the peak of his fame, in the wake of winning three NBA championships, it only meant the risk he took was that much bigger.\\n\\nApril 28, 2019", "We turn to leaders because they press us into action, because they make us feel that what we’re doing is healthy and intriguing and challenging. As long as that feeling is authentic, as long as it is not hidden from view, we can inspire entire groups.\\n\\nApril 28, 2019", "MJ brought out the fire in everyone around him. He never missed a practice, no matter how many minutes he played the night before, no matter how many points he scored. That attitude, that pattern, spread to the rest of us. —Scott Burrell NBA PLAYER\\n\\nApril 28, 2019", "Michael once observed, “I have always approached practice as a kind of proving ground, especially with rookies. They might have seen me on television, read about me . . . and might think they know what I’m all about. . . . I want them to know it isn’t gossip or rumors. I want them to know it all comes from hard work. Every time I stepped on the court, even though I was on top of the world, I felt like I had something to prove.”\\n\\nApril 28, 2019", "“We fight human nature in this business,” said NBA assistant coach Jim Boylen. “It’s the ‘Get-By’ Theory: most guys will work just as hard as they must in order to achieve success. Michael fought human nature. Despite his success, he never got comfortable or satisfied. He always needed more.”\\n\\nApril 28, 2019", "“Great players never look in the mirror and think, ‘I’m a great basketball player,” ’ Jordan said. “You ask yourself, ‘Am I the best player I can be?”’\\n\\nApril 28, 2019", "Our culture is engrossed with the path of other people’s lives, with the contours of their disappointments, their achievements, the moments that shaped them into the people they became. And there’s something startlingly similar about these biographies, one common theme, one shared image. There is always a moment in every one in which our hero could have quit, could have abandoned his passion, his drive, his yearning, and meandered on to something else.\\n\\nApril 29, 2019", "“Some people get frozen by a fear of failure,” Jordan said. “They get it from their peers or from just thinking about the possibility of negative results. They might be afraid of looking bad or being embarrassed. I realized that if I was going to achieve anything in life, I had to be aggressive. I had to get out there and go for it.”\\n\\nApril 29, 2019", "Jordan was drafted by one of the NBA’s lowliest franchises. The Chicago Bulls were a laughingstock when he joined them, a losing team playing in a crumbling stadium with virtually no tradition. He could have signed a short-term contract and skipped town when the team continued to struggle. Instead, he elevated the franchise to an unprecedented height. He changed everything. Now the Bulls are one of the NBA’s most recognizable franchises— even without Jordan— because Jordan felt an obligation to nurture the team that drafted him. “Part of the responsibility which went with your contract was to turn that team around and make it a winner— in fact, make it a champion,” said former Celtics coach Chris Ford. “That was an obligation, and it was deeply felt. I’m afraid not a lot of people feel that way today.”\\n\\nMay 3, 2019", "Aerobic guru Dr. Ken Cooper makes it very simple: If you walk two miles in thirty minutes three times a week, or two miles in forty minutes five times a week, you will have a 58 percent reduction in death by heart attack, stroke or cancer and increase your life span up to six years.\\n\\nMay 3, 2019", "One day during the 1997–98 season, Phil Jackson called off a practice. Michael said to Scottie Pippen, “We’re not playing well enough not to practice.” So they went to Phil and requested a practice. Turned out they practiced for three hours. Later, MJ said, “The best players have to be the caretakers.”\\n\\nMay 3, 2019", "Old men are always advising young men to save money. That is bad advice. Don’t save every nickel. Invest in yourself. I never saved a dollar until I was forty years old. —Henry Ford\\n\\nMay 3, 201"]


# for each highlight, get rid of the date.  Date range: May 17-21, 2017
notes_sans_dates = book_notes.map do |note|
  note.scan(/(?<=)(.*?)(?=\\n\\n)/).flatten.join
end

# get rid of the bookmarks
@book_highlights = notes_sans_dates.delete_if {|element| element==""}
@author = 'Pat Williams'
@book_title = 'How To Be Like Mike'
@url = 'https://www.amazon.com/How-Be-Like-Mike-Basketballs/dp/1558749462'

def show_all
  @book_highlights.map do |highlight|
    puts highlight
    puts ""
    puts "--------------------------------------------------------------------"
  end
  return "showed all the highlights!"
end

def sample
  @book_highlights.sample
end

# get to just the words
array_of_arrays_of_words = @book_highlights.map do |highlight|
  highlight.split(" ")
end

array_of_words = array_of_arrays_of_words.flatten
all_words = array_of_words.join(" ").downcase.gsub(/\W+/, ' ')

allTheWords = []
allTheWords << all_words
File.open("bagOfWords.txt", "w+") {|f| f.write allTheWords[0] }


puts ""
puts "The total number of words is #{array_of_words.length}!"
puts ""
puts "The total number of highlights is #{@book_highlights.length}"
puts ""
puts "Type sample to get a sample"
puts ""
puts "Type show_all to get all highlights"
puts ""
puts "Type all_words to see all the words as a single string"
puts ""

# TODO: follow ruby-lda documentation - prioritize mechanics over interpretation

Pry.start

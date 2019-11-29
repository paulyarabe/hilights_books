require 'pry'

book_notes = ["He wanted to know if there were lots of tiny universes dotted around. I told him never to be afraid to come up with an idea or a hypothesis no matter how daft (his words not mine) it might seem.\\n\\nNovember 6, 2018", "You can’t get to a time before the Big Bang because there was no time before the Big Bang. We have finally found something that doesn’t have a cause, because there was no time for a cause to exist in. For me this means that there is no possibility of a creator, because there is no time for a creator to have existed in.\\n\\nNovember 8, 2018", "I think belief in an afterlife is just wishful thinking. There is no reliable evidence for it, and it flies in the face of everything we know in science. I think that when we die we return to dust. But there’s a sense in which we live on, in our influence, and in our genes that we pass on to our children. We have this one life to appreciate the grand design of the universe, and for that I am extremely grateful.\\n\\nNovember 8, 2018", "We are more than just our genes. We may be no stronger or inherently more intelligent than our caveman ancestors. But what distinguishes us from them is the knowledge that we have accumulated over the last 10,000 years, and particularly over the last 300. I think it is legitimate to take a broader view and include externally transmitted information, as well as DNA, in the evolution of the human race.\\n\\nNovember 9, 2018", "Other qualities, such as intelligence, are probably controlled by a large number of genes, and it will be much more difficult to find them and work out the relations between them. Nevertheless, I am sure that during this century people will discover how to modify both intelligence and instincts like aggression. Laws will probably be passed against genetic engineering with humans. But some people won’t be able to resist the temptation to improve human characteristics, such as size of memory, resistance to disease and length of life. Once such superhumans appear, there are going to be major political problems with the unimproved humans, who won’t be able to compete.\\n\\nNovember 10, 2018", "In science fiction, space and time warps are commonplace. They are used for rapid journeys around the galaxy or for travel through time. But today’s science fiction is often tomorrow’s science fact.\\n\\nNovember 13, 2018", "The Leverhulme Centre for the Future of Intelligence is a multi-disciplinary institute, dedicated to researching the future of intelligence as crucial to the future of our civilisation and our species. We spend a great deal of time studying history, which, let’s face it, is mostly the history of stupidity. So it’s a welcome change that people are studying instead the future of intelligence. We are aware of the potential dangers, but perhaps with the tools of this new technological revolution we will even be able to undo some of the damage done to the natural world by industrialisation.\\n\\nNovember 18, 2018", "When I think about ingenuity, Einstein springs to mind. Where did his ingenious ideas come from? A blend of qualities, perhaps: intuition, originality, brilliance. Einstein had the ability to look beyond the surface to reveal the underlying structure. He was undaunted by common sense, the idea that things must be the way they seemed. He had the courage to pursue ideas that seemed absurd to others. And this set him free to be ingenious, a genius of his time and every other.\\n\\nNovember 18, 2018", "The human mind is an incredible thing. It can conceive of the magnificence of the heavens and the intricacies of the basic components of matter. Yet for each mind to achieve its full potential, it needs a spark. The spark of enquiry and wonder. Often that spark comes from a teacher. Allow me to explain. I wasn’t the easiest person to teach, I was slow to learn to read and my handwriting was untidy. But when I was fourteen my teacher at my school in St Albans, Dikran Tahta, showed me how to harness my energy and encouraged me to think creatively about mathematics. He opened my eyes to maths as the blueprint of the universe itself. If you look behind every exceptional person there is an exceptional teacher. When each of us thinks about what we can do in life, chances are we can do it because of a teacher.\\n\\nNovember 18, 2018", "I believe the future of learning and education is the internet. People can answer back and interact. In a way, the internet connects us all together like the neurons in a giant brain.\\n\\nNovember 18, 2018", "I am advocating that all young people should be familiar with and confident around scientific subjects, whatever they choose to do. They need to be scientifically literate, and inspired to engage with developments in science and technology in order to learn more.\\n\\nNovember 18, 2018", "So remember to look up at the stars and not down at your feet. Try to make sense of what you see and wonder about what makes the universe exist. Be curious. And however difficult life may seem, there is always something you can do and succeed at. It matters that you don’t just give up. Unleash your imagination. Shape the future.\\n\\nNovember 18, 201"]



# for each highlight, get rid of the date.  Date range: May 17-21, 2017
notes_sans_dates = book_notes.map do |note|
  note.scan(/(?<=)(.*?)(?=\\n\\n)/).flatten.join
end

# get rid of the bookmarks
@book_highlights = notes_sans_dates.delete_if {|element| element==""}
@author = 'Stephen Hawking'
@book_title = 'Brief Answers to the Big Questions'
@url = 'https://www.amazon.com/Brief-Answers-Questions-Stephen-Hawking/dp/1984819194'

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

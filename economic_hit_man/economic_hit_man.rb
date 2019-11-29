require 'pry'

book_notes = ["This prospect created an even greater new stratagem for development opportunities. Mammoth housing complexes would have to be constructed for these laborers, as would shopping malls, hospitals, fire and police department facilities, water and sewage treatment plants, electrical, communications, and transportation networks — in fact, the end result would be to create modern cities where once only deserts had existed. Here, too, was the opportunity to explore emerging technologies in, for example, desalinization plants, microwave systems, health care complexes, and computer technologies. Saudi Arabia was a planner’s dream come true, and also a fantasy realized, for anyone associated with the engineering and construction business. It presented an economic opportunity unrivaled by any in history: an economically developing country with virtually unlimited financial resources and a desire to enter the modern age in a big way, very quickly.\\n\\nApril 8, 2019", "I simply put my imagination to work and wrote reports that envisioned a glorious future for the kingdom. I had rule-of-thumb numbers I could use to estimate such things as the approximate cost to produce a megawatt of electricity, a mile of road, or adequate water, sewage, housing, food, and public services for one laborer. I was not supposed to refine these estimates or draw final conclusions. My job was simply to describe a series of plans (more accurately, perhaps, “visions”) of what might be possible, and to arrive at rough estimates of the costs associated with them. I always kept in mind the true objectives: maximizing payouts to US firms and making Saudi Arabia increasingly dependent on the United States. It did not take long to realize how closely the two went together. Almost all the newly developed projects would require continual upgrading and servicing, and they were so highly technical as to assure that the companies that originally developed them would have to maintain and modernize them.\\n\\nApril 8, 2019", "began to assemble two lists for each of the projects I envisioned: one for the types of design-and-construction contracts we could expect, and another for long-term service and management agreements. MAIN, Bechtel, Brown \\u0026 Root, Halliburton, Stone \\u0026 Webster, and many other US engineers and contractors would profit handsomely for decades to come.\\n\\nApril 8, 2019", "Beyond the purely economic, there was another twist that would render Saudi Arabia dependent on us, though in a very different way. The modernization of this oil-rich kingdom would trigger adverse reactions. For instance, conservative Muslims would be furious; Israel and other neighboring countries would feel threatened. The economic development of this nation was likely to spawn the growth of another industry: protecting the Arabian Peninsula. Private companies specializing in such activities, as well as the US military and defense industry, could expect generous contracts — and, once again, long-term service and management agreements. Their presence would require another phase of engineering and construction projects, including airports, missile sites, personnel bases, and all of the infrastructure associated with such facilities.\\n\\nApril 8, 2019", "I have found that people warm to you very quickly if you open your eyes, ears, and heart to their culture.\\n\\nApril 8, 2019", "“I’ll be frank,” Paula said one day, while we were sitting in a coffee shop. “The Indians and all the farmers who live along the river you’re damming hate you. Even people in the cities, who aren’t directly affected, sympathize with the guerrillas who’ve been attacking your construction camp. Your government calls these people Communists, terrorists, and narcotics traffickers, but the truth is they’re just people with families who live on lands your company is destroying.”\\n\\nApril 8, 2019", "It isn’t about changing the mechanics of economics. It is about changing the ideas, the dogmas that have driven economics for centuries: debt and fear, insufficiency, divide and conquer. It is about moving from ideas about merely being sustainable to ones that include regenerating areas devastated by agriculture, mining, and other destructive activities. It is about revolution. The transition from a death economy to a life economy is truly about a change in consciousness — a consciousness revolution.\\n\\nApril 9, 2019", "the marketplace is a democracy, if we choose to use it as such; that every time we buy something, we cast a vote.\\n\\nApril 9, 2019", "When you must shop, buy locally, as well as at consignment and thrift stores. Make things last. Buy goods and services from (and invest in) businesses that are committed to making a better world. No one is perfect, so seek out the ones that are doing the best in their field.\\n\\nApril 9, 2019", "3. Live consciously. Focus on doing things that enhance your relationship with other people, your community, and the world around you, including honoring nature in whatever form it takes in your locale. Break old patterns that revolve around materialism and buying “stuff”; downsize your house, car, and wardrobe; bicycle or take public transportation; avoid activities that use fossil fuels; give talks at local schools, libraries, and other forums.\\n\\nApril 9, 201"]



# for each highlight, get rid of the date.  Date range: May 17-21, 2017
notes_sans_dates = book_notes.map do |note|
  note.scan(/(?<=)(.*?)(?=\\n\\n)/).flatten.join
end

# get rid of the bookmarks
@book_highlights = notes_sans_dates.delete_if {|element| element==""}
@author = 'John Perkins'
@book_title = 'The New Confessions of an Economic Hit Man'
@url = 'https://www.amazon.com/New-Confessions-Economic-Hit-Man/dp/1626566747/ref=tmm_pap_swatch_0?_encoding=UTF8&qid=1556395771&sr=8-1'

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

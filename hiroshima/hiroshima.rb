require 'pry'

book_notes = ["Under many houses, people screamed for help, but no one helped; in general, survivors that day assisted only their relatives or immediate neighbours, for they could not comprehend or tolerate a wider circle of misery\\n\\nSeptember 16, 2018", "Patients were dying by the hundreds, but there was nobody to carry away the corpses. Some of the hospital staff distributed biscuits and rice balls, but the charnel-house smell was so strong that few were hungry. By three o’clock the next morning, after nineteen straight hours of his gruesome work, Dr. Sasaki was incapable of dressing another wound. He and some other survivors of the hospital staff got straw mats and went outdoors—thousands of patients and hundreds of dead were in the yard and on the driveway—and hurried around behind the hospital and lay down in hiding to snatch some sleep. But within an hour wounded people had found them; a complaining circle formed around them: “Doctors! Help us! How can you sleep?” Dr. Sasaki got up again and went back to work. Early in the day, he thought for the first time of his mother, at their country home in Mukaihara, thirty miles from town. He usually went home every night. He was afraid she would think he was dead.\\n\\nSeptember 16, 2018", "Mr. Tanimoto was still angry at doctors. He decided that he would personally bring one to Asano Park—by the scruff of the neck, if necessary. He crossed the river, went past the Shinto shrine where he had met his wife for a brief moment the day before, and walked to the East Parade Ground. Since this had long before been designated as an evacuation area, he thought he would find an aid station there. He did find one, operated by an Army medical unit, but he also saw that its doctors were hopelessly overburdened, with thousands of patients sprawled among corpses across the field in front of it. Nevertheless, he went up to one of the Army doctors and said, as reproachfully as he could, “Why have you not come to Asano Park? You are badly needed there.” Without even looking up from his work, the doctor said in a tired voice “This is my station.” “But there are many dying on the riverbank over there.”\\n\\nSeptember 16, 2018", "“The first duty,” the doctor said, “is to take care of the slightly wounded.” “Why—when there are many who are heavily wounded on the riverbank?” The doctor moved to another patient. “In an emergency like this,” he said, as if he were reciting from a manual, “the first task is to help as many as possible—to save as many lives as possible. There is no hope for the heavily wounded. They will die. We can’t bother with them.” “That may be right from a medical standpoint—” Mr. Tanimoto began, but then he looked out across the field, where the many dead lay close and intimate with those who were still living, and he turned away without finishing his sentence, angry now with himself. He didn’t know what to do; he had promised some of the dying people in the park that he would bring them medical aid. They might die feeling cheated. He saw a ration stand at one side of the field, and he went to it and begged some rice cakes and biscuits, and he took them back, in lieu of doctors, to the people in the park.\\n\\nSeptember 16, 2018", "he heard a voice ask from the underbrush, “Have you anything to drink?” He saw a uniform. Thinking there was just one soldier, he approached with the water. When he had penetrated the bushes, he saw there were about twenty men, and they were all in exactly the same nightmarish state: their faces were wholly burned, their eyesockets were hollow, the fluid from their melted eyes had run down their cheeks. (They must have had their faces upturned when the bomb went off; perhaps they were anti-aircraft personnel.) Their mouths were mere swollen, pus-covered wounds, which they could not bear to stretch enough to admit the spout of the teapot. So Father Kleinsorge got a large piece of grass and drew out the stem so as to make a straw, and gave them all water to drink that way. One of them said, “I can’t see anything.” Father Kleinsorge answered, as cheerfully as he could, “There’s a doctor at the entrance to the park. He’s busy now, but he’ll come soon and fix your eyes, I hope.”\\n\\nSeptember 17, 2018", "There set a loudspeaker in the ruins of the station. Many civilians, all of them were in boundage, some being helped by shoulder of their daughters, some sustaining their injured feet by sticks, they listened to the broadcast and when they came to realize the fact that it was the Emperor, they cried with full tears in their eyes. ‘What a wonderful blessing it is that Tenno himself call on us and we can hear his own voice in person. We are thoroughly satisfied in such a great sacrifice.’ When they came to know the war was ended—that is, Japan was defeated, they, of course, were deeply disappointed, but followed after their Emperor’s commandment in calm spirit, making wholehearted sacrifice for the everlasting peace of the world—and Japan started her new way.”\\n\\nSeptember 17, 201"]


# for each highlight, get rid of the date.  Date range: May 17-21, 2017
notes_sans_dates = book_notes.map do |note|
  note.scan(/(?<=)(.*?)(?=\\n\\n)/).flatten.join
end

# get rid of the bookmarks
@book_highlights = notes_sans_dates.delete_if {|element| element==""}
@author = 'John Hersey'
@book_title = 'Hiroshima'
@url = 'https://www.amazon.com/Hiroshima-John-Hersey/dp/0679721037/ref=sr_1_1?ie=UTF8&qid=1538341100&sr=8-1&keywords=hiroshima+hersey'

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

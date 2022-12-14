
# Examples for Diary Entry / Diary

``` ruby
# 1
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.all 
# => [diary_entry_1, diary_entry_2]

# 2
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.count_words
# => 7

# 3 
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.reading_time(2) 
# => 4

# 4
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.reading_time(0)
# => Reading speed must be above 0 

# 5 
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
diary.all 
# => "Zero diary entries have been added"

# 6
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.find_best_entry_for_reading_time(3, 1)
# => diary_entry_1

# 7
diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for exam")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.find_best_entry_for_reading_time(1, 2)
# => nil


``` 
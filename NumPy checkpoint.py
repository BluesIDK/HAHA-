import numpy as np

grades = np.array([85, 90, 88, 92, 95, 80, 75, 98, 89, 83])

mean_grade = np.mean(grades)
median_grade = np.median(grades)
std_deviation = np.std(grades)

max_grade = np.max(grades)
min_grade = np.min(grades)

sorted_grades = np.sort(grades)

index_of_highest = np.argmax(grades)

students_above_90 = np.sum(grades > 90)

percentage_above_90 = np.mean(grades > 90) * 100

percentage_below_75 = np.mean(grades < 75) * 100

high_performers = grades[grades > 90]

passing_grades = grades[grades > 75]

print("Mean Grade:", mean_grade)
print("Median Grade:", median_grade)
print("Standard Deviation:", std_deviation)
print("Max Grade:", max_grade)
print("Min Grade:", min_grade)
print("Sorted Grades:", sorted_grades)
print("Index of Highest Grade:", index_of_highest)
print("Students who scored above 90:", students_above_90)
print("Percentage of Students who scored above 90:", percentage_above_90)
print("Percentage of Students who scored below 75:", percentage_below_75)
print("High Performers:", high_performers)
print("Passing Grades:", passing_grades)

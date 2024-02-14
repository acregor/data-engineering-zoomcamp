def square_root_generator(limit):
    n = 1
    while n <= limit:
        yield n ** 0.5
        n += 1

# Example usage:
limit = 12
generator = square_root_generator(limit)

sum_vals = 0
for sqrt_value in generator:
  print(sqrt_value)
  sum_vals = sum_vals + sqrt_value

print(sum_vals)


def people_1():
    for i in range(1, 6):
        yield {"ID": i, "Name": f"Person_{i}", "Age": 25 + i, "City": "City_A"}

for person in people_1():
  print(person)

sum_vals_2 = 0
def people_2():
    for i in range(3, 9):
        yield {"ID": i, "Name": f"Person_{i}", "Age": 30 + i, "City": "City_B", "Occupation": f"Job_{i}"}


for person in people_2():
    print(person)


from itertools import chain

sum_vals = 0
for person in chain(people_1(), people_2()):
    print(person)
    sum_vals += person["Age"]

print("Sum of all ages:", sum_vals)

# Convert generators to list of dictionaries
list1 = list(people_1())
list2 = list(people_2())

# Merge both lists into one list
merged_list = list1 + list2

merge_result = []
for dict_ in merged_list:
    found = False
    for merge_dict in merge_result:
        if dict_['ID'] == merge_dict['ID']:
            merge_dict.update(dict_)  # merging dictionaries
            found = True
            break
    if not found:
        merge_result.append(dict_)

# Print merged result and calculate the sum of ages
sum_ages = 0
for person in merge_result:
    print(person)
    sum_ages += person['Age']

print("Sum of all ages:", sum_ages)

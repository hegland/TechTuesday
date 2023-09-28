import csv
import math
import random

# Generate 32 x and y coordinates
data = []
for i in range(32):
    x = random.uniform(0, 2*math.pi)
    y = math.sin(x)
    data.append((x, y))

# sort data by x
data.sort(key=lambda x: x[0])

# Write data to CSV file
with open('data.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['x', 'y'])
    for x, y in data:
        writer.writerow([x, y])
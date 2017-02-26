file = "/Users/chriscooper/Desktop/votes_short.txt"

lines =  File.readlines(file)

line = lines[0]

p epoch_time = line.split(' ')[1]
p campaign = line.split(' ')[2].split(':')[1]
p validity = line.split(' ')[3].split(':')[1]
p choice = line.split(' ')[4].split(':')[1]

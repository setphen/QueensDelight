import nltk as n
from itertools import islice
from pymarkov import markov

corpus = open('queensdelight.txt', 'r')
names = open('curious.txt', 'r')
output = open('output.txt', 'w')

corpus_raw = [line.rstrip('\n') for line in islice(corpus,68,2339)]

dict = markov.train(corpus_raw,2)

for i in range(0, 99):
    #print(markov.generate(dict, 60, 2))
    output.write(markov.generate(dict, 70, 2) + "\n")

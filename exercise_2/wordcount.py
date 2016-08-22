from __future__ import absolute_import, print_function, unicode_literals
from redis import StrictRedis
from collections import Counter
from streamparse.bolt import Bolt
import psycopg2


class WordCounter(Bolt):

	def initialize(self, conf, ctx):
		self.counts = Counter()
		self.redis = StrictRedis()
		self.conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
		
	def process(self, tup):
		word = tup.values[0]
				
		###########################################################
		# Table: Tweetwordcount
		# col 1: word (text [key])
		# col 2: count (int)
		# (these are creaated in advance in postgres)
		###########################################################
		
		# Increment the local count
		self.counts[word] = self.write_to_postgres(word)
		
		self.emit([word, self.counts[word]])
		
		# Log the count - just to see the topology running
		self.log('%s: %d' % (word, self.counts[word]))
	
	def write_to_postgres(self, word):
		# query to see if the word exist in the database
		# save word and counts to variable
		with self.conn.cursor() as cur:
			cur.execute(
			""" SELECT word, count FROM Tweetwordcount
				WHERE word = (%s);""", (word,) )
			self.conn.commit()
			db_tuple = cur.fetchone()
		
			if db_tuple:
				db_word, db_word_count = db_tuple
				# update count
				cur.execute(
				""" UPDATE Tweetwordcount
					SET count = (%s) 
					WHERE word = (%s);""", (db_word_count+1, db_word))
				self.conn.commit()
			else:
				db_word_count = 0
				cur.execute(
				""" INSERT INTO Tweetwordcount
					(word, count) VALUES (%s, %s); 
				""", (word, 1))
				self.conn.commit()
		return db_word_count+1
		

from __future__ import absolute_import, print_function, unicode_literals
import re
from streamparse.bolt import Bolt


# Function to check if the string contains only ascii chars
def ascii_string(s):
  return all(ord(c) < 128 for c in s)

class ParseTweet(Bolt):

    def process(self, tup):
        tweet = tup.values[0]  # extract the tweet

        #Split the tweet into words and remove special characters
        #more specific splitting than just .split() 
        words = [x for x in re.split("[ \"\.\?\!\(\)\[\]\{\}\$\*]", 
                re.sub("[,:;]", "", tweet).lower()) if len(x) > 0]

        # Filter out the hash tags, RT, @ and urls
        valid_words = []
        for word in words:
            if word.startswith("#"): continue
            if word.startswith("@"): continue
            if word.startswith("rt"): continue
            if word.startswith("http"): continue
            aword = word.strip("\"?><,'.:;)")
            #  check if the word contains only ascii
            if len(aword) > 0 and ascii_string(word):
                valid_words.append([aword])  # appends as list within list.

        if not valid_words: return
        # Emit all the words
        self.emit_many(valid_words)

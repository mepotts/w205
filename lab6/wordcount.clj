(ns wordcount
(:use     [streamparse.specs])
(:gen-class))

(defn wordcount [options]
 [
  ;; sentences spout configuration
  {"sentences-spout" (python-spout-spec
        options
        "spouts.sentences.Sentences"
        ["sentence"]
        )
  }
  ;; parse bolt configuration
  {"parse-bolt" (python-bolt-spec
        options
        {"sentences-spout" :shuffle}
        "bolts.parse.ParseTweet"
        ["valid_words"]
        :p 2
        )
  }
  ;; tweetcounter bolt configuration
  {"tweetcounter-bolt" (python-bolt-spec
        options
        {"parse-bolt" :shuffle}
        "bolts.tweetcounter.TweetCounter"
        ["word" "count"]
        )
  }
]

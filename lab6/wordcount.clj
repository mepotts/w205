(ns wordcount
(:use     [backtype.storm.clojure])
(:gen-class))

(defn wordcount [options]
 [
  ;; sentences spout configuration
  {"sentences-spout" (python-spout-spec
        options
        "spouts.sentences.Sentences"
        ["sentence"]
        :p 2
        )
  }
  ;; parse bolt configuration
  {"parse-bolt" (python-bolt-spec
        options
        {"sentences-spout" :shuffle}
        "bolts.parse.ParseTweet"
        ["word"]
        :p 2
        )
  ;; tweetcounter bolt configuration
  "tweetcounter-bolt" (python-bolt-spec
        options
        {"parse-bolt" ["word"]}
        "bolts.tweetcounter.TweetCounter"
        ["word" "count"]
        )
  }
]

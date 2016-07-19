(ns tweetcount
(:use     [streamparse.specs])
(:gen-class))

(defn tweetcount [options]
 [
  ;; sentences spout configuration
  {"sentences-spout" (python-spout-spec
        options
        "spouts.sentences.Sentences"
        ["sentence"]
        :p 1
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

  ;; tweetcounter bolt configuration
  "tweetcounter-bolt" (python-bolt-spec
        options
        {"parse-bolt" ["valid_words"]}
        "bolts.tweetcounter.TweetCounter"
        ["word" "count"]
        )
  }
]
)

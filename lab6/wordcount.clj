(ns wordcount
	(:use [streamparse.specs])
	(:gen-class))

(defn tweetcount [options]
	[ 
	;; spout configuration
	{
		"Sentences" (python-spout-spec
		options
		"spouts.sentences.Sentences"
		["sentence"]
		)
	}
	
	;; bolt configuration
	{
		"ParseTweet" (python-bolt-spec
		options
		{"Sentences" :shuffle}
		"bolts.parse.ParseTweet"
		["valid_words"]
		:p 2
		)
		
		"TweetCounter" (python-bolt-spec
		options
		{"ParseTweet" ["valid_words"]}
		"bolts.tweetcounter.TweetCounter"
		["word" "counts"])}
	]
)

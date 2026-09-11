; This names the dependencies the image holds, and the image computed its
; classpath, and compiled midje ahead of time, from a copy of this file when it
; was built. cyber-dojo.sh reads that baked classpath, not this file, so adding a
; dependency here does not put it on the classpath of a test run. Nothing could
; be added in any case: a kata runs with no network, so the only jars to be had
; are the ones already in the image.
;
; Adding source and fact files does work, and needs nothing here. The kata's own
; directory is on the classpath, so a fact file can require a source file beside
; it, and cyber-dojo.sh names every .clj file, of which the ones declaring a
; namespace are checked. Name files for the exercise being done; nothing anywhere
; expects the names this start-point ships.
;
; The image resolves the newest stable clojure when it is built and records it
; in /versions.json, which is what says authoritatively which version a kata
; is running. The number below is a copy of it made when this file was last
; edited, so read /versions.json if the two ever disagree.
(defproject hiker "1.0.0"
  :description "Run midje tests inside cyber-dojo"
  :dependencies [[org.clojure/clojure "1.12.6"]
                 [midje "1.10.10"]]
  :source-paths ["."])

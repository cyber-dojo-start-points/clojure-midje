(defproject hiker "1.0.0"
  :description "Run midje tests inside cyber-dojo"
  ; The image runs JDK 8, which loads class-file version 52 and no higher.
  ; Clojure 1.12.4 is the newest release inside that limit, and it is the
  ; version the image has in its local maven repository, so naming it here
  ; keeps the test run off the network.
  :dependencies [[org.clojure/clojure "1.12.4"]
                 [midje "1.10.10"]]
  :source-paths ["."]
  ; lein's default is to run the tests in a second JVM it starts for the
  ; project. Running them in lein's own JVM saves that whole JVM startup,
  ; which is a large part of the time a cyber-dojo test run takes.
  :eval-in :leiningen
  :plugins      [[lein-midje "3.2.2"]])

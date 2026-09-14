(ns hiker)

(defn answer []
    (binding [*out* *err*]
      (println "answer was called"))
    (* 6 7))

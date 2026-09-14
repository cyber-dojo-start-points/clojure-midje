(ns hiker)

(defn answer []
    (loop [i 0 total 0]
      (if (= i 10000)
        42
        (do
          (println (str "debug: i is " i ", total is " total))
          (recur (inc i) (+ total 1))))))

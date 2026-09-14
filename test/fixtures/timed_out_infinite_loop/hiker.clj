(ns hiker)

(defn answer []
    (loop [n 0]
      (recur (inc n))))

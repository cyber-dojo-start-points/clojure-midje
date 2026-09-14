(ns checksum)

(defn digits [n]
    (map #(Character/digit % 10) (str n)))

(defn checksum [n]
    (reduce + (digits n)))

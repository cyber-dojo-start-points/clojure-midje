(ns answer-size-test
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

(fact "the answer has two digits"
  (count (str (answer))) => 2)

(fact "the answer has three digits"
  (count (str (answer))) => 3)

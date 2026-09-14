(ns answer-size-test
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

(fact "the answer has two digits"
  (count (str (answer))) => 2)

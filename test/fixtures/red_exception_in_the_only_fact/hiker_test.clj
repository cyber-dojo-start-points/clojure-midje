(ns hiker-test
  (:require [midje.sweet :refer :all]
            [hiker :refer :all]))

(fact "the answer shared between no hikers"
  (share 0) => 42)

(ns hiker-test
  (:require [midje.sweet :refer :all]
            [clojure.test :refer [deftest is]]
            [hiker :refer :all]))

(fact "the answer is forty two"
  (answer) => 42)

; answer-size answers 1, so this assertion would fail if it were run.
(deftest the-answer-has-two-digits
  (is (= 2 (answer-size))))

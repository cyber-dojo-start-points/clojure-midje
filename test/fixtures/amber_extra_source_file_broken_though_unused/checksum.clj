(ns checksum)

; Nothing requires this file, and reduse is not a name anything defines.
(defn checksum [n]
    (reduse + (str n)))

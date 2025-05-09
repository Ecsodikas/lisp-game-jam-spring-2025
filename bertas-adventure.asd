;;;; bertas-adventure.asd

(asdf:defsystem #:bertas-adventure
  :description "Describe bertas-adventure here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:alexandria
               :serapeum
               :cl-raylib
               :cl-tiled)
  :components ((:file "package")
               (:file "entity")
               (:file "berta")
               (:file "screen")
               (:file "game")
               (:file "bertas-adventure")))

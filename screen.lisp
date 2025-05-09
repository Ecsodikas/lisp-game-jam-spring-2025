(in-package :bertas-adventure)

(defclass screen ()
  ((entity-list
    :initarg :entity-list
    :initform '()
    :accessor screen-entity-list)))

(defmethod add-entity ((s screen) (e base-entity))
  (push (screen-entity-list s) e))

(defmethod )

(in-package :bertas-adventure)

(defclass screen ()
  ((entity-list
    :initarg :entity-list
    :initform '()
    :accessor screen-entity-list)))

(defmethod screen-add-entity ((s screen) (e base-entity))
  (push (screen-entity-list s) e))

(defmethod screen-render ((s screen))
  (loop for e in (screen-entity-list s) do
    (when (typep e 'renderable-entity)
      (entity-render e))))

(defmethod screen-update ((s screen))
  (loop for e in (screen-entity-list s) do
    (entity-update e (get-frame-time))))

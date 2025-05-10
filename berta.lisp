(in-package :bertas-adventure)

(defclass berta (renderable-entity physicable-entity)
  ())

(defmethod entity-update ((e berta) delta)
  (entity-apply-force e (vec2 0 2)))

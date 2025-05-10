(in-package :bertas-adventure)

(defclass base-entity () ())

(defmethod entity-update ((entity base-entity) delta)
  nil)

(defclass transformable-entity (base-entity)
  ((entity-position
    :initarg :entity-position
    :initform (vec2 0 0)
    :accessor entity-position)))

(defmethod entity-transform ((entity transformable-entity) (dx number) (dy number))
  (incf (vx2 (entity-position entity)) dx)
  (incf (vy2 (entity-position entity)) dy))

(defclass renderable-entity (transformable-entity)
  ((entity-sprite
    :initarg :entitiy-sprite
    :initform (error "No sprite for renderable entity set.")
    :accessor entity-sprite)))

(defmethod entity-render ((entity renderable-entity))
  (let ((px (truncate (vx2 (entity-position entity))))
        (py (truncate (vy2 (entity-position entity)))))
    ;;; Change this for sprite + animation
    (draw-rectangle px py 20 20 :black)))

(defclass physicable-entity (transformable-entity)
  ((entity-mass
    :initarg :entity-mass
    :initform 1
    :accessor entity-mass)
   (entity-collision-shape
    :initarg :collision-shape
    :initform (make-rectangle :x 0 :y 0 :width 20 :height 20)
    :accessor entity-collision-shape)))

(defmethod entity-apply-force ((entity physicable-entity) (force vec2))
  (entity-transform entity (vx2 force) (vy2 force)))

(defmethod entity-collide ((entity physicable-entity) (other physicable-entity))
  (let ((entity-shape (entity-collision-shape entity))
        (entity-pos (entity-position entity))
        (other-shape (entity-collision-shape other))
        (other-pos (entity-position other)))
    (setf (rectangle-x entity-shape) (vx2 entity-pos))
    (setf (rectangle-y entity-shape) (vy2 entity-pos))
    (setf (rectangle-x other-shape) (vx2 other-pos))
    (setf (rectangle-y other-shape) (vy2 other-pos))
    (check-collision-recs entity-shape other-shape)))

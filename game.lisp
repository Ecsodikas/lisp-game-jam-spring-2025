(in-package :bertas-adventure)

(defclass game ()
  ((screen-list
    :initarg :screen-list
    :initform '()
    :accessor screen-list)
   (active-screen
    :initarg :active-screen
    :initform (error "No active screen set.")
    :accessor active-screen)))

(defmethod game-render ((g game))
  (let ((screen (active-screen g)))
    (screen-render screen)))

(defmethod game-update ((g game))
  (let ((screen (active-screen g)))
    (screen-update screen)))

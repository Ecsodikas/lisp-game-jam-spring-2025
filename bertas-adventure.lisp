;;;; bertas-adventure.lisp

(in-package #:bertas-adventure)

(defun main ()
  (let* ((screen-width 800)
         (screen-height 450)
         (berta (make-instance 'berta :entitiy-sprite "" :entity-position (vec2 20 20)))
         (debug-entity (make-instance 'berta :entitiy-sprite "" :entity-position (vec2 20 90))))
    (with-window (screen-width screen-height "Bertas Adventure")
      (set-target-fps 60)               ; Set our game to run at 60 FPS
      (loop until (window-should-close) ; detect window close button or ESC key
            do
               (entity-apply-force berta (vec2 0 2))
               (with-drawing
                 (clear-background :raywhite)
                 (entity-render berta)
                 (entity-render debug-entity))))))

(main)

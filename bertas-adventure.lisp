;;;; bertas-adventure.lisp

(in-package #:bertas-adventure)

(defun main ()
  (let* ((screen-width 800)
         (screen-height 450)
         (berta (make-instance 'berta :entitiy-sprite "" :entity-position (vec2 20 20)))
         (debug-entity (make-instance 'renderable-entity :entitiy-sprite "" :entity-position (vec2 20 90)))
         (screen (make-instance 'screen :entity-list (list berta debug-entity)))
         (game (make-instance 'game :active-screen screen)))
    (with-window (screen-width screen-height "Bertas Adventure")
      (set-target-fps 60)               ; Set our game to run at 60 FPS
      (loop until (window-should-close) ; detect window close button or ESC key
            do
               (with-drawing
                 (clear-background :raywhite)
                 (game-update game)
                 (game-render game))))))

(main)

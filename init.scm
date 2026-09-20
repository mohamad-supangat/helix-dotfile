
;; Run at startup. Helix context is bound to *helix.cx*
(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static. "helix/static.scm"))

(require "vim-hx/init.scm")
(set-vim-keybindings!)
(require "notify/notify.scm")
; zen mode
(require "matte.hx/matte.scm")
(require "scopeline/scopeline.scm")

(require "helix/keymaps.scm")

; best fie manager for helix
(require "grove/grove.scm")
(define (grove-workspace-launch?)
  (let loop ([args (cdr (command-line))])
    (cond
      [(null? args) #f]
      [(equal? (car args) "--") #f]
      [(or (equal? (car args) "-w")
           (equal? (car args) "--working-dir"))
       #t]
      [else (loop (cdr args))])))

(grove-start!
  #:visibility
  (if (grove-workspace-launch?) 'always 'focused))
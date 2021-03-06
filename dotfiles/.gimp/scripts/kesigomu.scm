; Kesigomu.scm Ver1.0  Etigoya
;                    Ver1.0    
;                                                                
;                                                                               
;                                                                   

(define (script-fu-kesigomu image drawable randpoint brush)

(let* ((old-brush (car (gimp-context-get-brush)))
       (width (car (gimp-drawable-width drawable)))
       (height (car (gimp-drawable-height drawable)))
       (point 4)
       (count 0)
       (segment)
       (xa 0)(ya 0))

   (gimp-image-undo-group-start image)
   (gimp-layer-add-alpha drawable)
   (gimp-context-set-brush (car brush))
		
   (while (<= count randpoint)
      (set! segment (cons-array 4 'double))
      (set! xa (rand width))
      (set! ya (rand height))
      (aset segment 0 (* 1 xa))
      (aset segment 1 (* 1 ya))
      (aset segment 2 (* 1 xa))
      (aset segment 3 (* 1 ya))
      (gimp-eraser-default drawable point segment)
      (set! count (+ count 1)) )

   (gimp-levels drawable 4 100 255 1 0 255)

   (gimp-context-set-brush old-brush)	
   (gimp-image-undo-group-end image)
   (gimp-displays-flush) ))

(script-fu-register "script-fu-kesigomu"
_"Kesigomu..."
"                                                            "
                    "         "
                    "         "
                    "2005/03/10"
                    "RGB* GRAY*"
                    SF-IMAGE      "Image"       0
                    SF-DRAWABLE   "Drawable"    0
                    SF-ADJUSTMENT "                         " '(30 1 1000 1 10 0 1)
                    SF-BRUSH      "Brush"             '("Galaxy, Big" 1.0 20 0) )

(script-fu-menu-register "script-fu-kesigomu"
_"<Image>/Script-Fu/Alchemy")
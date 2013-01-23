(in-package :t2l)
(setq prules
      '((:S :S :S)
      (:S :A)
      (:S :B)
      (:S :O)
      (:S :Q)
      (:A :P :O)
      (:A :Q :R)
      (:B :U :V)
      (:B :X :W)
      (:O 15)
      (:O 14)
      (:O 10)
      (:O 9)
      (:O 8)
      (:O 7)
      (:P -9)
      (:P -8)
      (:P -7)
      (:P -5)
      (:Q 8)
      (:Q 7)
      (:Q 5)
      (:Q 4)
      (:R -5)
      (:R -4)
      (:R -3)
      (:R -2)
      (:U -15)
      (:U -14)
      (:U -10)
      (:O -9)
      (:O -8)
      (:O -7)
      (:V 9)
      (:V 8)
      (:W 7)
      (:W 5)
      (:X 4)
      (:X 3)
      (:X 2)))
(time
 (setq vars (mapprules '(60 _ _) prules :listdxx t)))
(fail)
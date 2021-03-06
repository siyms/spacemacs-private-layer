;;; Display Layer

(setq display-packages
      '(
        all-the-icons
        (prettify-utils :location (recipe :fetcher github :repo "Ilazki/prettify-utils.el"))
        (pretty-magit :location local)
        (pretty-fonts :location local)
        ))

;;; Locals
;;;; Pretty-code

;; (defun display/init-pretty-code ()
;;   (use-package pretty-code
;;     :after python
;;     :config
;;     (progn
;;       (global-prettify-symbols-mode 1)
;;       (setq python-pretty-pairs
;;             (pretty-code-get-pairs
;;              '(:lambda "lambda" :def "def"
;;                        :null "None" :true "True" :false "False"
;;                        :int "int" :float "float" :str "str" :bool "bool"
;;                        :not "not" :for "for" :in "in" :not-in "not in"
;;                        :return "return" :yield "yield"
;;                        :and "and" :or "or"
;;                        :tuple "Tuple"
;;                        :pipe "tz-pipe"
;;                        )))

;;       (pretty-code-set-pairs `(
;;                                (python-mode-hook ,python-pretty-pairs))))))

;;;; Pretty-fonts

(defun display/init-pretty-fonts ()
  (use-package pretty-fonts
    :config
    (progn
      ;; (pretty-fonts-set-kwds
      ;;  '(;; Fira Code Ligatures
      ;;    ;; (pretty-fonts-fira-font prog-mode-hook)
      ;;    )
      ;;  )

      (pretty-fonts-set-fontsets
       '(
         ;; ("fontawesome"
         ;;  ;;                         
         ;;  #xf07c #xf0c9 #xf0c4 #xf0cb #xf017 #xf101)

         ;; ("all-the-icons"
         ;;  ;;    
         ;;  #xe907 #xe928)

         ;; ("github-octicons"
         ;;  ;;                          
         ;;  #xf091 #xf059 #xf076 #xf075 #xf05f  #xf016)

         ("material icons"
          ;;        
          #xe871 #xe918 #xe3e7
          ;;
          #xe3d0 #xe3d1 #xe3d2 #xe3d4 #xe3d5 #xe3d6 #xe3d7 #xe3d8)

         ;; ("Symbola"
         ;;  ;; 𝕊    ⨂      ∅      ⟻    ⟼     ⊙      𝕋       𝔽
         ;;  #x1d54a #x2a02 #x2205 #x27fb #x27fc #x2299 #x1d54b #x1d53d
         ;;  ;; 𝔹    𝔇       𝔗
         ;;  #x1d539 #x1d507 #x1d517)
         )))))

;;;; Pretty-magit

(defun display/init-pretty-magit ()
  (use-package pretty-magit
    :after magit
    :config
    (progn
      (pretty-magit "Feature" ? (:foreground "slate gray" :height 1.0 :family "FontAwesome"))
      (pretty-magit "Add"     ? (:foreground "#375E97" :height 1.0 :family "FontAwesome"))
      (pretty-magit "Fix"     ? (:foreground "#FB6542" :height 1.0 :family "FontAwesome"))
      (pretty-magit "Clean"   ? (:foreground "#FFBB00" :height 1.0 :family "FontAwesome"))
      (pretty-magit "Docs"    ? (:foreground "#3F681C" :height 1.0 :family "FontAwesome"))
      (pretty-magit "master"  ? (:box nil :height 1.0 :family "github-octicons") t)
      (pretty-magit "origin"  ? (:box nil :height 1.0 :family "github-octicons") t)
      )))

;;; Core Packages
;;;; All-the-icons

(defun display/init-all-the-icons ()
  (use-package all-the-icons
    ))

;;;; Prettify-utils

(defun display/init-prettify-utils ()
  (use-package prettify-utils))

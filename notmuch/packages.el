;;; packages.el --- notmuch Layer packages File for Spacemacs

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq notmuch-packages
      '(notmuch
        counsel
        org
        avy
        wid-edit
        persp-mode
        notmuch-labeler
        ))

;; List of packages to exclude.
(setq notmuch-excluded-packages '())

(defun notmuch/post-init-persp-mode ()
  ;; do not save erc buffers
  (with-eval-after-load 'persp-mode
    (push (lambda (b) (with-current-buffer b (eq major-mode 'notmuch-hello-mode))) persp-filter-save-buffers-functions)
    (push (lambda (b) (with-current-buffer b (eq major-mode 'notmuch-tree-mode))) persp-filter-save-buffers-functions)
    (push (lambda (b) (with-current-buffer b (eq major-mode 'notmuch-search-mode))) persp-filter-save-buffers-functions)
    (push (lambda (b) (with-current-buffer b (eq major-mode 'notmuch-show-mode))) persp-filter-save-buffers-functions)
    (push (lambda (b) (with-current-buffer b (eq major-mode 'notmuch-message-mode))) persp-filter-save-buffers-functions)
    )

  (spacemacs|define-custom-layout "@Notmuch"
    :binding "n"
    :body
    (progn
      (defun spacemacs-layouts/add-notmuch-buffer-to-persp ()
        (persp-add-buffer (current-buffer) (persp-get-by-name "@Notmuch")))
      (add-hook 'notmuch-tree-mode-hook #'spacemacs-layouts/add-notmuch-buffer-to-persp)
      (add-hook 'notmuch-search-mode-hook #'spacemacs-layouts/add-notmuch-buffer-to-persp)
      (add-hook 'notmuch-hello-mode-hook #'spacemacs-layouts/add-notmuch-buffer-to-persp)
      (add-hook 'notmuch-show-mode-hook #'spacemacs-layouts/add-notmuch-buffer-to-persp)
      (add-hook 'notmuch-message-mode-hook #'spacemacs-layouts/add-notmuch-buffer-to-persp)
      (call-interactively 'notmuch)
      )))

;; For each package, define a function notmuch/init-<package-notmuch>
(defun notmuch/post-init-counsel ())
(defun notmuch/post-init-avy ()
  (use-package avy
    :ensure t
    :config
    (progn
      (defun ace-link--notmuch-hello-collect ()
        "Collect the positions of visible links in *notmuch-hello*."
        (let (candidates pt)
          (save-excursion
            (save-restriction
              (goto-char (point-min))
              (setq pt (point))
              (while (progn (widget-forward 1)
                            (> (point) pt))
                (setq pt (point))
                (when (get-char-property (point) 'button)
                  (push (point) candidates)))))
          (nreverse candidates)))

      (defun ace-link--notmuch-hello-action (pt)
        (when (number-or-marker-p pt)
          (goto-char (1+ pt))
          (widget-button-press (point))))

      (defun ace-link-notmuch-hello ()
        "Open a visible link in *notmuch-hello*."
        (interactive)
        (let ((pt (avy-with ace-link-notmuch-hello
                    (avy--process
                     (ace-link--notmuch-hello-collect)
                     #'avy--overlay-pre))))
          (ace-link--notmuch-hello-action pt)))

      (defun ace-link--notmuch-show-collect ()
        "Collect the positions of visible links in `notmuch-show' buffer."
        (let (candidates pt)
          (save-excursion
            (save-restriction
              (narrow-to-region
               (window-start)
               (window-end))
              (goto-char (point-min))
              (while (re-search-forward "https?://" nil t)
                (setq pt (- (point) (length (match-string 0))))
                (push pt candidates))))
          (nreverse candidates)))

      (defun ace-link--notmuch-show-action  (pt)
        (goto-char pt)
        (browse-url-at-point))

      (defun ace-link-notmuch-show ()
        "Open a visible link in `notmuch-show' buffer."
        (interactive)
        (let ((pt (avy-with ace-link-notmuch-show
                    (avy--process
                     (ace-link--notmuch-show-collect)
                     #'avy--overlay-pre))))
          (ace-link--notmuch-show-action pt)))
      )
    )
  )

(defun notmuch/post-init-wid-edit ())
(defun notmuch/post-init-org ())
(defun notmuch/init-notmuch-labeler ())
(defun notmuch/init-notmuch ()
  "Initialize my package"
  (use-package notmuch
    :commands (notmuch-tree)
    :defer t
    :init (progn
            (defun my-buffer-face-mode-notmuch ()
              "Sets a fixed width (monospace) font in current buffer"
              (interactive)
              (setq buffer-face-mode-face '(:family "Inziu Iosevka SC"))
              (buffer-face-mode))

            (add-hook 'notmuch-hello-mode-hook 'my-buffer-face-mode-notmuch)
            (add-hook 'notmuch-tree-mode-hook 'my-buffer-face-mode-notmuch)
            (add-hook 'notmuch-search-mode-hook 'my-buffer-face-mode-notmuch)
            (add-hook 'notmuch-message-mode-hook 'my-buffer-face-mode-notmuch)
            (add-hook 'notmuch-tree-mode-hook (lambda () (setq line-spacing nil)))


            (spacemacs/set-leader-keys
              "an" 'notmuch
              "at" 'notmuch-tree
              "a;" 'notmuch-search
              "ai" 'counsel-notmuch
              ))

    :config (progn

              (eval-after-load "notmuch-hello" `(define-key notmuch-hello-mode-map "o" 'ace-link-notmuch-hello))
              (eval-after-load "notmuch-show" `(define-key notmuch-show-mode-map "o" 'ace-link-notmuch-show))

              (defun notmuch-update ()
                (interactive)
                (start-process-shell-command "manually update email" nil "afew -a -m && mbsync gmail && notmuch new && afew -a -t")
                (notmuch-hello-update)
                )

              (defvar counsel-notmuch-history nil
                "History for `counsel-notmuch'.")

              (defun counsel-notmuch-cmd (input)
                "Return mail"
                (counsel-require-program "/usr/local/bin/notmuch")
                (format "notmuch search %s" input)
                )

              (defun counsel-notmuch-function (input)
                "helper function"
                (setq counsel-notmuch-base-command "/usr/local/bin/notmuch search")
                (if (< (length input) 3)
                    (counsel-more-chars 3)
                  (counsel--async-command
                   (counsel-notmuch-cmd input)) '("" "working...")))

              (defun counsel-notmuch-action-tree (thread)
                "open search result in tree view"
                (setq thread-id (car (split-string thread "\\ +")))
                (notmuch-tree thread-id initial-input nil)
                )

              (defun my-notmuch-show (thread-id &optional elide-toggle parent-buffer query-context buffer-name)
                "Run \"notmuch show\" with the given thread ID and display results.

ELIDE-TOGGLE, if non-nil, inverts the default elide behavior.

The optional PARENT-BUFFER is the notmuch-search buffer from
which this notmuch-show command was executed, (so that the
next thread from that buffer can be show when done with this
one).

The optional QUERY-CONTEXT is a notmuch search term. Only
messages from the thread matching this search term are shown if
non-nil.

The optional BUFFER-NAME provides the name of the buffer in
which the message thread is shown. If it is nil (which occurs
when the command is called interactively) the argument to the
function is used.

Returns the buffer containing the messages, or NIL if no messages
matched."
                (interactive "sNotmuch show: \nP")
                (let (
                      ;; (buffer-name "*counsel-notmuch-show*")
                      ;; We override mm-inline-override-types to stop application/*
                      ;; parts from being displayed unless the user has customized
                      ;; it themselves.
                      (mm-inline-override-types
                       (if (equal mm-inline-override-types
                                  (eval (car (get 'mm-inline-override-types 'standard-value))))
                           (cons "application/*" mm-inline-override-types)
                         mm-inline-override-types)))
                  (switch-to-buffer (get-buffer-create buffer-name))
                  ;; No need to track undo information for this buffer.
                  (let ((inhibit-read-only t))
                    (erase-buffer))
                  (setq buffer-undo-list t)

                  (notmuch-show-mode)

                  ;; Set various buffer local variables to their appropriate initial
                  ;; state. Do this after enabling `notmuch-show-mode' so that they
                  ;; aren't wiped out.
                  (setq notmuch-show-thread-id thread-id
                        notmuch-show-parent-buffer parent-buffer
                        notmuch-show-query-context query-context

                        notmuch-show-process-crypto notmuch-crypto-process-mime
                        ;; If `elide-toggle', invert the default value.
                        notmuch-show-elide-non-matching-messages
                        (if elide-toggle
                            (not notmuch-show-only-matching-messages)
                          notmuch-show-only-matching-messages))

                  (add-hook 'post-command-hook #'notmuch-show-command-hook nil t)
                  (jit-lock-register #'notmuch-show-buttonise-links)

                  (notmuch-tag-clear-cache)

                  (let ((inhibit-read-only t))
                    (if (notmuch-show--build-buffer)
                        ;; Messages were inserted into the buffer.
                        (current-buffer)

                      ;; No messages were inserted - presumably none matched the
                      ;; query.
                      (kill-buffer (current-buffer))
                      (ding)
                      (message "No messages matched the query!")
                      nil))))

              (defun counsel-notmuch-action-show (thread)
                "open search result in show view"
                (setq thread-id (car (split-string thread "\\ +")))
                (my-notmuch-show thread-id nil nil nil "*counsel-notmuch-show*")
                )




              (defun counsel-notmuch (&optional initial-input)
                "search for your email in notmuch"
                (interactive)
                (ivy-set-prompt 'counsel-notmuch counsel-prompt-function)
                (ivy-read "Notmuch Search"
                          #'counsel-notmuch-function
                          :initial-input initial-input
                          :dynamic-collection t
                          ;; :keymap counsel-notmuch-map
                          :history 'counsel-notmuch-history
                          :action '(1
                                    ("o" counsel-notmuch-action-show "Show")
                                    ("t" counsel-notmuch-action-tree "Tree View")
                                    )
                          :unwind (lambda ()
                                    (counsel-delete-process)
                                    (swiper--cleanup))
                          :caller 'counsel-notmuch))

              (defun counsel-notmuch-transformer (str)
                "blah"
                (when (string-match "thread:" str)

                  (setq mid (substring str 25))
                  (setq date (substring str 25 37))
                  (setq mat (substring mid (string-match "[[]" mid) (+ (string-match "[]]" mid) 1)))
                  (setq people (truncate-string-to-width (s-trim (nth 1 (split-string mid "[];]"))) 20))
                  (setq subject (truncate-string-to-width (s-trim (nth 1 (split-string mid "[;]"))) (- (window-width) 32)))
                  (setq output (format "%s\t%10s\t%20s\t%s" date mat people subject))
                  output
                  )
                )

              (ivy-set-display-transformer 'counsel-notmuch 'counsel-notmuch-transformer)


              (defun open-message-with-mail-app-notmuch-tree ()
                (interactive)
                (let* ((msg-path (car (plist-get (notmuch-tree-get-message-properties) :filename)))
                       (temp (make-temp-file "notmuch-message-" nil ".eml")))
                  (shell-command-to-string (format "cp '%s' '%s'; open '%s' -a Mail; l/bin/rm '%s'" msg-path temp temp temp))))
              (defun open-message-with-mail-app-notmuch-show ()
                (interactive)
                (let* ((msg-path (car (plist-get (notmuch-show-get-message-properties) :filename)))
                       (temp (make-temp-file "notmuch-message-" nil ".eml")))
                  (shell-command-to-string (format "cp '%s' '%s'; open '%s' -a Mail; l/bin/rm '%s'" msg-path temp temp temp))))

              (defun notmuch-search-delete () (interactive) (notmuch-search-add-tag (list "+deleted" "-inbox" "-unread")) (notmuch-search-next-thread))
              (defun notmuch-tree-delete () (interactive) (notmuch-tree-add-tag (list "+deleted" "-inbox" "-unread")) (notmuch-tree-next-message))

              (defun notmuch-search-killed () (interactive) (notmuch-search-add-tag (list "+killed" "-inbox" "-unread")) (notmuch-search-next-thread))
              (defun notmuch-tree-killed () (interactive) (notmuch-tree-add-tag (list "+killed" "-inbox" "-unread")) (notmuch-tree-next-message))



              (setq message-send-mail-function 'message-send-mail-with-sendmail)
              (setq notmuch-search-oldest-first nil)
              (setq send-mail-function 'sendmail-send-it)
              (setq sendmail-program "/usr/local/bin/msmtp")
              (define-key notmuch-tree-mode-map (kbd "i") 'open-message-with-mail-app-notmuch)

              (spacemacs/set-leader-keys-for-major-mode 'notmuch-message-mode
                dotspacemacs-major-mode-leader-key 'message-send-and-exit
                "c" 'message-send-and-exit
                "k" 'message-kill-buffer
                "a" 'message-kill-buffer
                "s" 'message-dont-send         ; saves as draft
                "f" 'mml-attach-file)

              (evilified-state-evilify-map notmuch-search-mode-map
                :mode notmuch-search-mode
                :bindings
                (kbd "j") 'notmuch-search-next-thread
                (kbd "k") 'notmuch-search-previous-thread
                (kbd "t") 'notmuch-tree-from-search-thread
                (kbd "T") 'notmuch-tree-from-search-current-query
                (kbd "d") 'notmuch-search-delete
                (kbd "x") 'notmuch-search-killed
                )
              (evilified-state-evilify-map notmuch-tree-mode-map
                :mode notmuch-tree-mode
                :bindings
                (kbd "j") 'notmuch-tree-next-message
                (kbd "k") 'notmuch-tree-prev-message
                (kbd "S") 'notmuch-search-from-tree-current-query
                (kbd "t") 'notmuch-tree
                (kbd "r") 'notmuch-search-reply-to-thread-sender
                (kbd "i") 'open-message-with-mail-app-notmuch-tree
                (kbd "d") 'notmuch-tree-delete
                (kbd "x") 'notmuch-tree-killed
                )

              (evilified-state-evilify-map notmuch-hello-mode-map
                :mode notmuch-hello-mode
                :bindings
                (kbd "t") 'notmuch-tree
                (kbd "q") 'notmuch-hello-update
                (kbd "e") 'notmuch-update
                )

              (evilified-state-evilify-map notmuch-show-mode-map
                :mode notmuch-show-mode
                :bindings
                (kbd "i") 'open-message-with-mail-app-notmuch-show
                (kbd "I") 'notmuch-show-view-all-mime-parts
                )


              )))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;; Layers
(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil)
     better-defaults
     emacs-lisp
     evil-snipe
     imenu-list
     notmuch
     git
     version-control
     colors
     (org :variables org-enable-bootstrap-support t)
     pandoc
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 40
            )
     ivy
     mybibtex
     (latex :variables latex-build-command "LatexMk")
     (ess :variables ess-enable-smart-equals t)
     (ranger :variables ranger-show-preview nil)
     python
     osx
     shell-scripts
     (spell-checking :variables spell-checking-enable-by-default nil)
     (myelfeed :variables rmh-elfeed-org-files (list "~/.emacs.d/private/feed.org"))
     syntax-checking
     display
     personal
     (languagetool :variables langtool-language-tool-jar "/usr/local/Cellar/languagetool/3.7/libexec/languagetool-commandline.jar")
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.

;;;; Additional Packages

   dotspacemacs-additional-packages '(
                                      ivy-dired-history
                                      shrink-path
                                      fringe-helper
                                      org-super-agenda
                                      shackle
                                      ;; ivy-rich
                                      kurecolor
                                      dired-narrow
                                      prodigy
                                      ranger
                                      ox-twbs
                                      sx
                                      ob-async
                                      org-edit-latex
                                      language-detection
                                      shr-tag-pre-highlight
                                      eshell-git-prompt
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
;;;; Excluded Packages
   dotspacemacs-excluded-packages '(
                                    vi-tilde-fringe
                                    spaceline
                                    exec-path-from-shell
                                    neotree
                                    magit-gitflow
                                    ;; popwin
                                    ;; window-purpose
                                    ;; ivy-purpose
                                    ;; popup
                                    magit-gh-pulls
                                    org-repo-todo
                                    auto-complete
                                    org-projectile
                                    linum
                                    linum-relative
                                    skewer-mode
                                    livid-mode
                                    gh-md
                                    disaster
                                    fancy-battery
                                    helm-flyspell
                                    flyspell-correct-helm
                                    lorem-ipsum
                                    symon
                                    highlight-indentation
                                    smooth-scrolling
                                    clean-aindent-mode
                                    helm-c-yasnippet
                                    ace-jump-helm-line
                                    helm-themes
                                    helm-swoop
                                    helm-spacemacs-help
                                    ido-vertical-mode
                                    flx-ido
                                    helm-purpose
                                    helm-make
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

;;; Init
(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists nil
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         (modern-dark :location (recipe :fetcher github :repo "fuxialexander/modern-light-theme"))
                         (modern-light :location (recipe :fetcher github :repo "fuxialexander/modern-light-theme"))
                         )
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;;Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("input mono narrow"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1.2
                               )
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "@"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands.
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p'
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   dotspacemacs-frame-title-format "%I@%S$%a$"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

;;; User-init
(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (setq gc-cons-threshold 1000000)
  (add-to-list 'load-path "~/.emacs.d/private/elisp/")

  (defun t/project-root ()
    "Get project root without throwing"
    (let (projectile-require-project-root strict-p)
      (projectile-project-root)))

  (defun t/init-modeline () (+doom-modeline|init))
  (require 'doom-modeline)
  (add-hook 'after-init-hook #'t/init-modeline)


  )

;;; User-config
(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Use variable width font faces in current buffer
  ;; Use monospaced font faces in current buffer

  ;; (with-eval-after-load 'spaceline
  ;;   (spaceline-toggle-minor-modes-off)
  ;;   (spaceline-toggle-column-off)
  ;;   (spaceline-toggle-buffer-position-off)
  ;;   (spaceline-toggle-hud-off)
  ;;   (spaceline-toggle-purpose-off)
  ;;   (spaceline-toggle-line-column-off)
  ;;   (spaceline-toggle-buffer-size-off)
  ;;   (spaceline-toggle-buffer-encoding-abbrev-off)
  ;;   (spaceline-toggle-org-clock-on)
  ;;   (spaceline-toggle-selection-info-off)
  ;;   (spaceline-toggle-projectile-root-off)
  ;;   )

  (use-package shrink-path
    :commands (shrink-path-prompt shrink-path-file-mixed))

;;;; UI
  (setf (cdr (assq 'continuation fringe-indicator-alist))
        '(nil nil) ;; no continuation indicators
        ;; '(nil right-curly-arrow) ;; right indicator only
        ;; '(left-curly-arrow nil) ;; left indicator only
        ;; '(left-curly-arrow right-curly-arrow) ;; default
        )
  (setf (cdr (assq 'truncation fringe-indicator-alist))
        '(nil nil) ;; no continuation indicators
        ;; '(nil right-curly-arrow) ;; right indicator only
        ;; '(left-curly-arrow nil) ;; left indicator only
        ;; '(left-curly-arrow right-curly-arrow) ;; default
        )

  (setq-default
   auto-revert-remote-files t
   bidi-display-reordering nil ; disable bidirectional text for tiny performance boost
   blink-matching-paren nil    ; don't blink--too distracting
   cursor-in-non-selected-windows nil  ; hide cursors in other windows
   frame-inhibit-implied-resize t
   highlight-nonselected-windows nil
   vc-follow-symlinks t
   image-animate-loop t
   indicate-buffer-boundaries nil
   indicate-empty-lines nil
   image-animate-loop t
   indicate-buffer-boundaries nil
   indicate-empty-lines nil
   max-mini-window-height 0.3
   mode-line-default-help-echo nil ; disable mode-line mouseovers
   mouse-yank-at-point t           ; middle-click paste at point, not at click
   resize-mini-windows 'grow-only  ; Minibuffer resizing
   show-help-function nil          ; hide :help-echo text
   split-width-threshold 160       ; favor horizontal splits
   uniquify-buffer-name-style 'forward
   use-dialog-box nil              ; always avoid GUI
   visible-cursor nil
   x-stretch-cursor nil
   ;; defer jit font locking slightly to [try to] improve Emacs performance
   jit-lock-defer-time nil
   jit-lock-stealth-nice 0.1
   jit-lock-stealth-time 0.2
   jit-lock-stealth-verbose nil
   ;; `pos-tip' defaults
   pos-tip-internal-border-width 6
   pos-tip-border-width 1
   ;; no beeping or blinking please
   ring-bell-function #'ignore
   visible-bell nil
   window-divider-default-places t
   window-divider-default-bottom-width 0
   window-divider-default-right-width 1)
  ;; standardize default fringe width
  (defvar doom-fringe-size '4
    "Default fringe width.")
  (if (fboundp 'fringe-mode) (fringe-mode doom-fringe-size))
  (add-hook 'after-init-hook #'window-divider-mode)
  (global-hl-line-mode -1)
  (use-package fringe-helper
    :commands (fringe-helper-define fringe-helper-convert)
    :init
    (unless (fboundp 'define-fringe-bitmap)
      (defun define-fringe-bitmap (&rest _))))
  ;; NOTE Adjust these bitmaps if you change `doom-fringe-size'
  (with-eval-after-load 'flycheck
    ;; because git-gutter is in the left fringe
    (setq flycheck-indication-mode 'right-fringe)
    ;; A non-descript, left-pointing arrow
    (fringe-helper-define 'flycheck-fringe-bitmap-double-arrow 'center
      "...X...."
      "..XX...."
      ".XXX...."
      "XXXX...."
      ".XXX...."
      "..XX...."
      "...X...."))

  ;; subtle diff indicators in the fringe
  (with-eval-after-load 'git-gutter-fringe+
    ;; places the git gutter outside the margins.
    (setq-default fringes-outside-margins t)
    (setq git-gutter-fr+-side 'left-fringe)
    ;; thin fringe bitmaps
    (fringe-helper-define 'git-gutter-fr+-added '(center repeated)
      "XXX.....")
    (fringe-helper-define 'git-gutter-fr+-modified '(center repeated)
      "XXX.....")
    (fringe-helper-define 'git-gutter-fr+-deleted 'bottom
      "X......."
      "XX......"
      "XXX....."
      "XXXX...."))

;;;; Prodigy
  (use-package prodigy
    :ensure t
    :init
    ;; After initialization, start these services
    :config
    ;; Tag
    ;; Define a new tag with ARGS.
    (prodigy-define-tag
      :name 'email
      :ready-message "Checking Email using IMAP IDLE. Ctrl-C to shutdown.")
    ;; Service
    ;; Define a new service with ARGS.
    (prodigy-define-service
      :name "imapnotify-gmail"
      :command "/usr/local/bin/imapnotify"
      :args (list "-c" (expand-file-name "./imapnotify.js" (getenv "HOME")))
      :tags '(email)
      :kill-signal 'sigkill)
    )

  (prodigy-start-service (prodigy-find-service "imapnotify-gmail"))


;;;; Layout
  (with-eval-after-load 'persp-mode
    (push (lambda (b) (with-current-buffer b (eq major-mode 'dired-mode))) persp-filter-save-buffers-functions)
    (push (lambda (b) (with-current-buffer b (eq major-mode 'elfeed-search-mode))) persp-filter-save-buffers-functions)
    (push (lambda (b) (with-current-buffer b (eq major-mode 'elfeed-show-mode))) persp-filter-save-buffers-functions)

    ;; see documentation for other possible values
    (setq persp-add-buffer-on-after-change-major-mode nil)

    ;; above setting will not discriminate and bring ephemeral buffers e.g.
    ;; *magit* which you probably don't want. You can filter them out.
    (add-hook 'persp-common-buffer-filter-functions
              ;; there is also `persp-add-buffer-on-after-change-major-mode-filter-functions'
              #'(lambda (b) (or
                             (string-prefix-p " " (buffer-name b))
                             (string-match-p "feed.org" (buffer-name b))
                             (and
                              (string-prefix-p "*" (buffer-name b))
                              (not (string-match-p "*Org Src" (buffer-name b)))
                              ;; (not (string-match-p "*Org Agenda" (buffer-name b)))
                              )
                             )))
    )

  (spacemacs|define-custom-layout "@Lisp"
    :binding "l"
    :body
    (progn
      (defun spacemacs-layouts/add-lisp-buffer-to-persp ()
        (persp-add-buffer (current-buffer) (persp-get-by-name "@Lisp")))
      (add-hook 'emacs-lisp-mode-hook #'spacemacs-layouts/add-lisp-buffer-to-persp)
      (call-interactively 'spacemacs/find-dotfile)
      ))

  (spacemacs|define-custom-layout "@Research"
    :binding "r"
    :body
    (progn
      (defun spacemacs-layouts/add-research-buffer-to-persp ()
        (persp-add-buffer (current-buffer) (persp-get-by-name "@Research")))
      ;; (add-hook 'org-mode-hook #'spacemacs-layouts/add-research-buffer-to-persp)
      (add-hook 'org-src-mode-hook #'spacemacs-layouts/add-research-buffer-to-persp)
      ;; (add-hook 'org-agenda-mode-hook #'spacemacs-layouts/add-research-buffer-to-persp)
      (add-hook 'inferior-ess-mode-hook #'spacemacs-layouts/add-research-buffer-to-persp)
      ;; (add-hook 'ess-mode-hook #'spacemacs-layouts/add-research-buffer-to-persp)
      (add-hook 'dired-mode-hook #'spacemacs-layouts/add-research-buffer-to-persp)
      (org-agenda nil "n")
      ))

  (spacemacs|define-custom-layout "@Elfeed"
    :binding "e"
    :body
    (progn
      (defun spacemacs-layouts/add-elfeed-buffer-to-persp ()
        (persp-add-buffer (current-buffer) (persp-get-by-name "@Elfeed")))
      (add-hook 'elfeed-search-mode-hook #'spacemacs-layouts/add-elfeed-buffer-to-persp)
      (add-hook 'elfeed-show-mode-hook #'spacemacs-layouts/add-elfeed-buffer-to-persp)
      (call-interactively 'elfeed)
      ))



  ;; ;;;; Solaire-mode
  ;;   ;; brighten buffers (that represent real files)
  ;;   (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
  ;;   ;; To enable solaire-mode unconditionally for certain modes:
  ;;   (add-hook 'ediff-prepare-buffer-hook #'solaire-mode)

  ;;   ;; ...if you use auto-revert-mode:
  ;;   (add-hook 'after-revert-hook #'turn-on-solaire-mode)

  ;;   ;; highlight the minibuffer when it is activated:
  ;;   (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

  ;;   ;; if the bright and dark background colors are the wrong way around, use this
  ;;   ;; to switch the backgrounds of the `default` and `solaire-default-face` faces.
  ;;   ;; This should be used *after* you load the active theme!
  ;;   ;;
  ;;   ;; NOTE: This is necessary for themes in the doom-themes package!


;;;; ESS
  (with-eval-after-load 'ess
    (defun ess-indent-region-with-formatR-tidy-source (beg end)
      "Format region of code R using formatR::tidy_source()."
      (interactive "r")
      (let ((string
             (replace-regexp-in-string
              "\"" "\\\\\\&"
              (replace-regexp-in-string ;; how to avoid this double matching?
               "\\\\\"" "\\\\\\&"
               (buffer-substring-no-properties beg end))))
            (buf (get-buffer-create "*ess-command-output*")))
        (ess-force-buffer-current "Process to load into:")
        (ess-command
         (format
          "local({
          formatR::tidy_source(text=\"\n%s\",
                               arrow=TRUE, width.cutoff=60) })\n"
          string) buf)
        (with-current-buffer buf
          (goto-char (point-max))
          ;; (skip-chars-backward "\n")
          (let ((end (point)))
            (goto-char (point-min))
            (goto-char (1+ (point-at-eol)))
            (setq string (buffer-substring-no-properties (point) end))
            ))
        (delete-region beg end)
        (insert string)
        (delete-backward-char 2)
        ))
    )

;;;; Applescript
;;;;; Helper function
  (defun applescript-quote-string (argument)
    "Quote a string for passing as a string to AppleScript."
    (if (or (not argument) (string-equal argument ""))
        "\"\""
      ;; Quote using double quotes, but escape any existing quotes or
      ;; backslashes in the argument with backslashes.
      (let ((result "")
            (start 0)
            end)
        (save-match-data
          (if (or (null (string-match "[^\"\\]" argument))
                  (< (match-end 0) (length argument)))
              (while (string-match "[\"\\]" argument start)
                (setq end (match-beginning 0)
                      result (concat result (substring argument start end)
                                     "\\" (substring argument end (1+ end)))
                      start (1+ end))))
          (concat "\"" result (substring argument start) "\"")))))

;;;;; Papers
  (defun export-papers-bib ()
    (interactive)
    (do-applescript
     (format
      "tell application id \"com.mekentosj.papers3\"
         set outFile to \"/Users/xfu/Dropbox/org/ref.bib\"
         export (every publication item of application id \"com.mekentosj.papers3\" as list) to outFile
       end tell"
      )))
  ;; ;;;;; Tyme2
  ;;   ;; (defun start-tyme ()
  ;;   ;;   (setq taskname (nth 4 (org-heading-components)))
  ;;   ;;   (do-applescript
  ;;   ;;    (format
  ;;   ;;     "set tsk to %s
  ;;   ;;     set proj to %s
  ;;   ;;     tell application \"Tyme2\"
  ;;   ;;     set judgep to false
  ;;   ;;     repeat with someproj in every project
  ;;   ;;       if ((name of someproj) is proj) then set judgep to true
  ;;   ;;     end repeat
  ;;   ;;     if (judgep is false) then make new project with properties {name:proj}
  ;;   ;;     end tell
  ;;   ;;     tell application \"Tyme2\"
  ;;   ;;     set judget to false
  ;;   ;;     repeat with sometsk in every task of project proj
  ;;   ;;       if ((name of sometsk) is tsk) then set judget to true
  ;;   ;;     end repeat
  ;;   ;;     if (judget is false) then make new task of (project proj) with properties {name:tsk, taskType:\"timed\", completed:false}
  ;;   ;;     end tell
  ;;   ;;     tell application \"Tyme2\"
  ;;   ;;     set t to id of the first item of (every task of project proj whose name = tsk)
  ;;   ;;     StartTrackerForTaskID t
  ;;   ;;     end tell"
  ;;   ;;     (applescript-quote-string taskname)
  ;;   ;;     (applescript-quote-string (file-name-base))
  ;;   ;;     )))
  ;;   ;; (defun stop-tyme ()
  ;;   ;;   (setq taskname (nth 4 (org-heading-components)))
  ;;   ;;   (do-applescript
  ;;   ;;    (format
  ;;   ;;     "set tsk to %s
  ;;   ;;        set proj to %s
  ;;   ;;        tell application \"Tyme2\"
  ;;   ;;        set judgep to false
  ;;   ;;        repeat with someproj in every project
  ;;   ;;          if ((name of someproj) is proj) then set judgep to true
  ;;   ;;        end repeat
  ;;   ;;        if (judgep is false) then make new project with properties {name:proj}
  ;;   ;;        end tell
  ;;   ;;        tell application \"Tyme2\"
  ;;   ;;        set judget to false
  ;;   ;;        repeat with sometsk in every task of project proj
  ;;   ;;          if ((name of sometsk) is tsk) then set judget to true
  ;;   ;;        end repeat
  ;;   ;;        if (judget is false) then make new task of (project proj) with properties {name:tsk, taskType:\"timed\", completed:false}
  ;;   ;;        end tell
  ;;   ;;        tell application \"Tyme2\"
  ;;   ;;        set t to id of the first item of (every task of project proj whose name = tsk)
  ;;   ;;        StopTrackerForTaskID t
  ;;   ;;        end tell"
  ;;   ;;     (applescript-quote-string taskname)
  ;;   ;;     (applescript-quote-string (file-name-base))
  ;;   ;;     )))
  ;;   ;; (add-hook 'org-clock-in-hook 'start-tyme)
  ;;   ;; (add-hook 'org-clock-out-hook 'stop-tyme)

;;;; Tramp
  (setq tramp-default-method "scp")
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq projectile-mode-line "Projectile")
  (setq tramp-remote-process-environment (quote ("TMOUT=0" "LC_CTYPE=''" "TERM=dumb" "INSIDE_EMACS='25.2.1,tramp:2.2.13.25.2'" "CDPATH=" "HISTORY=" "MAIL=" "MAILCHECK=" "MAILPATH=" "PAGER=cat" "autocorrect=" "correct=" "http_proxy=http://proxy.cse.cuhk.edu.hk:8000" "https_proxy=http://proxy.cse.cuhk.edu.hk:8000" "ftp_proxy=http://proxy.cse.cuhk.edu.hk:8000")))
  (with-eval-after-load 'tramp-sh
    (add-to-list 'tramp-remote-path "/research/kevinyip10/xfu/miniconda3/bin")
    (add-to-list 'tramp-remote-path "/uac/gds/xfu/bin")
    )

;;;; Keybindings
  (spacemacs/set-leader-keys "TAB" 'ivy-switch-buffer)
  (global-set-key (kbd "C-H-M-!") 'spacemacs/custom-perspective-@Research )
  (global-set-key (kbd "C-H-M-@") 'spacemacs/custom-perspective-@Notmuch )
  (global-set-key (kbd "C-H-M-#") 'spacemacs/custom-perspective-@Elfeed )
  (global-set-key (kbd "C-H-M-$") 'spacemacs/custom-perspective-@Lisp )

  (global-set-key (kbd "H-1") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-1-and-exit)
  (global-set-key (kbd "H-2") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-2-and-exit)
  (global-set-key (kbd "H-3") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-3-and-exit)
  (global-set-key (kbd "H-4") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-4-and-exit)
  (global-set-key (kbd "H-5") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-5-and-exit)
  (global-set-key (kbd "H-6") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-6-and-exit)
  (global-set-key (kbd "H-7") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-7-and-exit)
  (global-set-key (kbd "H-8") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-8-and-exit)
  (global-set-key (kbd "H-9") 'spacemacs/workspaces-transient-state/eyebrowse-switch-to-window-config-9-and-exit)


  (global-set-key (kbd "H-,") 'customize )
  (global-set-key (kbd "H-f") 'ace-window )
  (global-set-key (kbd "H-l") 'org-store-link )
  (global-set-key (kbd "H-d") 'split-window-right-and-focus )
  (global-set-key (kbd "H-D") 'split-window-below-and-focus )
  (global-set-key (kbd-mac-command "h") 'ns-do-hide-emacs)
  (global-set-key (kbd "<f11>") nil)
  ;; (global-set-key (kbd "C-H-f") 'spacemacs/toggle-fullscreen)
  (eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-.") nil))
  (eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-;") nil))
  (eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "M-;") 'flyspell-correct-previous-word-generic))
  (eval-after-load "org" '(define-key org-mode-map (kbd "M-;") nil))
  (eval-after-load "org" '(define-key org-mode-map (kbd "M-;") 'flyspell-correct-previous-word-generic))
  (eval-after-load "org" '(define-key org-mode-map (kbd "H-i") 'org-ref-ivy-insert-cite-link))
  (eval-after-load "org" '(define-key org-mode-map (kbd "C-j") 'counsel-org-goto))
  (eval-after-load "org" '(define-key org-mode-map (kbd "C-H-j") 'counsel-org-goto-all))
  (eval-after-load "org" '(define-key org-mode-map (kbd "H-k") 'org-insert-link))
  (eval-after-load "auctex" '(define-key latex-mode-map (kbd "H-i") 'ivy-bibtex))
  (eval-after-load "eshell" '(eshell-git-prompt-use-theme 'powerline))
  (define-key evil-hybrid-state-map (kbd "C-;") 'hippie-expand)


;;;; Emacs-mac settings
  ;; (when (and (spacemacs/system-is-mac) (display-graphic-p))
  ;; (mac-auto-operator-composition-mode)

  ;; (defface ligature-operator-face
  ;;   '((t (:inherit default :family "fira code")))
  ;;   "Face to use for birthday tags in org-mode"
  ;;   :group 'ligature)
  ;; (mapc (lambda (mode)
  ;;         (font-lock-add-keywords mode '(
  ;;            (" \\([!#$%&'()+,./;<=>?@^_`{|}~-]+\\) " 1 'ligature-operator-face)
  ;;            )))
  ;;       '(text-mode
  ;;         latex-mode
  ;;         html-mode
  ;;         org-mode
  ;;         python-mode
  ;;         lua-mode
  ;;         javascript-mode
  ;;         shell-script-mode
  ;;         emacs-lisp-mode
  ;;         texinfo-mode))
  ;; (add-hook 'ess-mode-hook
  ;;           (lambda ()
  ;;             (font-lock-add-keywords nil '(
  ;;                                           (" \\([!#$%&'()+,./;<=>?@^_`{|}~-]+\\) " 1 'ligature-operator-face)
  ;;                                       ))))

  ;; Disable pixel-by-pixel scrolling, since it's extremely choppy.
  (setq mac-mouse-wheel-smooth-scroll nil)
  ;; )

;;;; Term line-spacing
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq line-spacing nil)))


;;;; Org-mode settings
  (with-eval-after-load 'org

    (setq
     org-tags-column 0
     org-indirect-buffer-display 'current-window
     )

;;;;; Org-mode clock
    (defun org-modify-and-clock-current-heading ()
      (interactive)
        (org-narrow-to-subtree)
        (org-clock-in)
        )

    (define-key org-mode-map "\C-cn" #'org-modify-and-clock-current-heading)

;;;;; Org-mode fast-todo-selection
    (defun org-fast-todo-selection ()
      "Fast TODO keyword selection with single keys.
Returns the new TODO keyword, or nil if no state change should occur."
      (let* ((fulltable org-todo-key-alist)
             (done-keywords org-done-keywords) ;; needed for the faces.
             (maxlen (apply 'max (mapcar
                                  (lambda (x)
                                    (if (stringp (car x)) (string-width (car x)) 0))
                                  fulltable)))
             (expert t)
             (fwidth (+ maxlen 3 1 3))
             (ncol (/ (- (window-width) 4) fwidth))
             tg cnt e c tbl
             groups ingroup)
        (save-excursion
          (save-window-excursion
            (if expert
                (set-buffer (get-buffer-create " *Org todo*"))
              (org-switch-to-buffer-other-window (get-buffer-create " *Org todo*")))
            (erase-buffer)
            (setq-local org-done-keywords done-keywords)
            (setq tbl fulltable cnt 0)
            (while (setq e (pop tbl))
              (cond
               ((equal e '(:startgroup))
                (push '() groups) (setq ingroup t)
                (unless (= cnt 0)
                  (setq cnt 0)
                  (insert "\n"))
                (insert "{ "))
               ((equal e '(:endgroup))
                (setq ingroup nil cnt 0)
                (insert "}\n"))
               ((equal e '(:newline))
                (unless (= cnt 0)
                  (setq cnt 0)
                  (insert "\n")
                  (setq e (car tbl))
                  (while (equal (car tbl) '(:newline))
                    (insert "\n")
                    (setq tbl (cdr tbl)))))
               (t
                (setq tg (car e) c (cdr e))
                (when ingroup (push tg (car groups)))
                (setq tg (org-add-props tg nil 'face
                                        (org-get-todo-face tg)))
                (when (and (= cnt 0) (not ingroup)) (insert "  "))
                (insert "[" c "] " tg (make-string
                                       (- fwidth 4 (length tg)) ?\ ))
                (when (= (setq cnt (1+ cnt)) ncol)
                  (insert "\n")
                  (when ingroup (insert "  "))
                  (setq cnt 0)))))
            (insert "\n")
            (goto-char (point-min))
            (unless expert (org-fit-window-to-buffer))
            (message "[T]ODO | [D]ONE | [W]AIT | [K]ILL | [O]UTD | [SPC]:Clear")
            (setq c (let ((inhibit-quit t)) (read-char-exclusive)))
            (cond
             ((or (= c ?\C-g)
                  (and (= c ?q) (not (rassoc c fulltable))))
              (setq quit-flag t))
             ((= c ?\ ) nil)
             ((setq e (rassoc c fulltable) tg (car e))
              tg)
             (t (setq quit-flag t)))))))

;;;;; Org-pandoc
    (setq org-pandoc-options '(
                               (standalone . t)
                               (self-contained . t)
                               ))


;;;;; Org-web
    (require 'org-web-tools)
    (require 'org-protocol-capture-html)
;;;;; Org-tag-with-ivy
    (defun spacemacs//org-ctrl-c-ctrl-c-counsel-org-tag ()
      "Hook for `org-ctrl-c-ctrl-c-hook' to use `counsel-org-tag'."
      (if (save-excursion (beginning-of-line) (looking-at "[ \t]*$"))
          (or (run-hook-with-args-until-success 'org-ctrl-c-ctrl-c-final-hook)
              (user-error "C-c C-c can do nothing useful at this location"))
        (let* ((context (org-element-context))
               (type (org-element-type context)))
          (case type
            ;; When at a link, act according to the parent instead.
            (link (setq context (org-element-property :parent context))
                  (setq type (org-element-type context)))
            ;; Unsupported object types: refer to the first supported
            ;; element or object containing it.
            ((bold code entity export-snippet inline-babel-call inline-src-block
                   italic latex-fragment line-break macro strike-through subscript
                   superscript underline verbatim)
             (setq context
                   (org-element-lineage
                    context '(radio-target paragraph verse-block table-cell)))))
          ;; For convenience: at the first line of a paragraph on the
          ;; same line as an item, apply function on that item instead.
          (when (eq type 'paragraph)
            (let ((parent (org-element-property :parent context)))
              (when (and (eq (org-element-type parent) 'item)
                         (= (line-beginning-position)
                            (org-element-property :begin parent)))
                (setq context parent type 'item))))
          (case type
            ((headline inlinetask)
             (save-excursion (goto-char (org-element-property :begin context))
                             (call-interactively 'counsel-org-tag)) t)))))
    (add-hook 'org-ctrl-c-ctrl-c-hook 'spacemacs//org-ctrl-c-ctrl-c-counsel-org-tag)
    (add-hook 'org-capture-before-finalize-hook 'counsel-org-tag)



;;;;; Org-deprecated
    ;; here goes your Org config :)
    ;; (add-to-list 'load-path "~/scimax")
    ;; (add-to-list 'load-path "~/scimax/ob-ipython")
    ;; (require 'ob-ipython)
    ;; (require 'scimax-org-babel-ipython)
    ;; (require 'scimax-org-babel-python)
    ;; (setq org-babel-python-command "python")
    ;; (require 'ox-ipynb)
;;;;; Org-hook
    (defun my-org-mode-hook ()
      ;; (org-edit-latex-mode 1)
      )
    (defun my-redo-all-agenda-buffers ()
      (interactive)
      (dolist (buffer (buffer-list))
        (with-current-buffer buffer
          (when (derived-mode-p 'org-agenda-mode)
            (org-agenda-redo t)))
        )
      )
    ;; (add-hook 'org-mode-hook #'my-org-mode-hook)
    ;; (add-hook 'org-mode-hook (lambda() (add-hook 'after-save-hook 'my-org-save-hook nil 'make-it-local)))
    (defun my-org-save-hook ()
      ;; (my-redo-all-agenda-buffers)
      ;; (org-store-agenda-views)
      ;; (org-agenda nil "n")
      )
;;;;; Org-babel
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       ;; (ipython . t)
       (python . t)
       (ditaa . t)
       (dot . t)
       (R . t)
       (gnuplot . t)
       (shell . t)
       (org . t)
       (latex . t)))
;;;;; Org-latex
    ;; set up tikz as one of the default packages for LaTeX
    (setq
     org-latex-pdf-process '("latexmk -pdflatex='%latex -shell-escape -interaction nonstopmode' -pdf -output-directory=%o -f %f")
     org-latex-create-formula-image-program 'dvisvgm
     org-latex-packages-alist
     (quote (("" "color" t)
             ("" "minted" t)
             ("" "parskip" t)
             ("" "tikz" t)))
     )
    (advice-add 'org-agenda-goto :after
                (lambda (&rest args)
                  (org-narrow-to-subtree)))

;;;;; Org-agenda
    ;; (defun org-agenda-config ()
    ;;   "Used for hook of org-agenda-mode"
    ;;   (local-set-key "\C-w\C-w" 'evil-window-next)
    ;;   )
    ;; (add-hook 'org-agenda-mode-hook 'org-agenda-config)
    (setq
     org-directory "/Users/xfu/Dropbox/org/"
     diary-file "/Users/xfu/Dropbox/org/cal.diary"
     org-default-notes-file "/Users/xfu/Dropbox/org/inbox.org"
     org-log-done 'time
     org-agenda-restore-windows-after-quit t
     org-agenda-files '("/Users/xfu/Dropbox/org/")
     org-refile-targets '((nil :maxlevel . 9)
                          (org-agenda-files :maxlevel . 9))
     org-refile-use-outline-path 'file
     org-outline-path-complete-in-steps nil
     org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA"

     org-global-properties (quote (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00")))
;;;;; Org-TODO
     org-use-fast-todo-selection t
     org-use-fast-tag-selection nil
     org-log-into-drawer t
     org-log-state-notes-into-drawer t
     org-todo-keywords '(
                         (sequence "TODO(t!)"  "|" "DONE(d!)")
                         (sequence "WAIT(w!)" "|" "OUTD(o!)" "KILL(k!)")
                         )
     org-todo-keyword-faces '(
                              ("TODO" :inherit default :foreground "#d34a65" :weight bold :box (:line-width 1 :color "#d34a65" :style nil))
                              ("DONE" :inherit default :foreground "#15c188" :weight bold :box (:line-width 1 :color "#15c188" :style nil))
                              ("WAIT" :inherit default :foreground "#ff9d00" :weight bold :box (:line-width 1 :color "#ff9d00" :style nil))
                              ("KILL" :inherit default :foreground "#6f2faf" :weight bold :box (:line-width 1 :color "#6f2faf" :style nil))
                              ("OUTD" :inherit default :foreground "#6fa1f2" :weight bold :box (:line-width 1 :color "#6fa1f2" :style nil))
                              )
     )
    (setq org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
                :time-grid t  ; Items that appear on the time grid
                :todo "TODAY")  ; Items that have this TODO keyword
         (:name "Important"
                ;; Single arguments given alone
                :tag "bills"
                :priority "A")
         ;; Set order of multiple groups at once
         (:order-multi (2 (:name "Shopping in town"
                                 ;; Boolean AND group matches items that match all subgroups
                                 :and (:tag "shopping" :tag "@town"))
                          (:name "Food-related"
                                 ;; Multiple args given in list with implicit OR
                                 :tag ("food" "dinner"))
                          (:name "Personal"
                                 :habit t
                                 :tag "personal")
                          (:name "Space-related (non-moon-or-planet-related)"
                                 ;; Regexps match case-insensitively on the entire entry
                                 :and (:regexp ("space" "NASA")
                                               ;; Boolean NOT also has implicit OR between selectors
                                               :not (:regexp "moon" :tag "planet")))))
         ;; Groups supply their own section names when none are given
         (:todo "WAITING" :order 8)  ; Set order of this section
         (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
                ;; Show this group at the end of the agenda (since it has the
                ;; highest number). If you specified this group last, items
                ;; with these todo keywords that e.g. have priority A would be
                ;; displayed in that group instead, because items are grouped
                ;; out in the order the groups are listed.
                :order 9)
         (:priority<= "B"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 1)
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         ))
;;;;; Org-tools
    (setq
     org-download-screenshot-method "screencapture -i %s"
     )
;;;;; Org-brain
    (setq
     org-brain-path "/Users/xfu/Dropbox/org/brain"
     org-id-track-globally t
     org-id-locations-file "~/.emacs.d/.org-id-locations"
     org-brain-visualize-default-choices 'all
     )

;;;;; Org-reference
    (setq
     org-ref-default-bibliography '("/Users/xfu/Dropbox/org/ref.bib")
     org-ref-bibliography-notes "/Users/xfu/Dropbox/org/ref.org"
     org-ref-completion-library 'org-ref-ivy-cite
     bibtex-completion-bibliography "/Users/xfu/Dropbox/org/ref.bib"
     bibtex-completion-library-path "/Users/xfu/Dropbox/Library.papers3/Files/"
     bibtex-completion-notes-path "/Users/xfu/Dropbox/org/ref.org"
     bibtex-completion-pdf-field nil
     bibtex-completion-pdf-open-function (lambda (fpath) (start-process "open" "*open*" "open" fpath))
     ;; bibtex-completion-pdf-open-function (lambda (fpath) (call-process "open" nil 0 nil "-a" "/Applications/Skim.app" fpath))
     )
    (defun org-mac-papers-open (papers-link)
      (start-process "open papers" nil "/usr/bin/open" (concat "papers3:" papers-link )))
    (org-add-link-type "papers3" 'org-mac-papers-open)

;;;;; Org-appearance
    (setq
     org-image-actual-width 800
     org-fontify-whole-heading-line t
     org-fontify-done-headline t
     org-fontify-quote-and-verse-blocks t
     org-ellipsis " + "
     ;; org-ellipsis ""
     ;; org-columns-ellipses "…"
     org-bullets-bullet-list '("" "" "" "" "" "" "" "")
     )
    )

;;;;; Org-capture
  (with-eval-after-load 'org-capture

    (setq org-capture-templates
          (quote (
                  ("h" "HSCR Journal" entry
                   (file+datetree "~/Dropbox/org/hscr.org")
                   "* %^{Logging for...} :logs:hscr:
:PROPERTIES:
:Created: %U
:Linked: %a
:END:
%i
%?" :empty-lines 2 :clock-in t :created t)
                  ("n" "N2O Journal" entry
                   (file+datetree "~/Dropbox/org/n2o.org")
                   "* %^{Logging for...} :logs:n2o:
:PROPERTIES:
:Created: %U
:END:
%i
%?" :empty-lines 2 :clock-in t :created t)

                  ("f" "FANTOM Journal" entry
                   (file+datetree "~/Dropbox/org/n2o.org")
                   "* %^{Logging for...} :logs:fantom:
:PROPERTIES:
:Created: %U
:Linked: %a
:END:
%i
%?" :empty-lines 2 :clock-in t :created t)

                  ("l" "Life Journal" entry
                   (file+datetree "~/Dropbox/org/life.org")
                   "* %^{Logging for...} :logs:life:
:PROPERTIES:
:Created: %U
:Linked: %a
:END:
%i
%?" :empty-lines 2 :clock-in t :created t)

                  ("a" "Article" entry
                   (file "~/Dropbox/org/ref.org")
                   "* %^{Title}  :article:
:PROPERTIES:
:Created: %U
:Linked: %a
:END:
%i
Brief description:
%?" :prepend f :empty-lines 2 :created t)

                  ("w" "Web site" entry
                   (file "~/Dropbox/org/inbox.org")
                   "* %a :website:\n%U %?\n%:initial
:PROPERTIES:
:Created: %U
:Linked: %a
:END:
" :prepend f :empty-lines 2 :created t)
                  ))
          )
    )

  (with-eval-after-load 'org-datetree
    (setq
     org-datetree-base-level 2
     org-datetree-add-timestamp nil
          )
    )
  (with-eval-after-load 'org-agenda
    (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
    (defun place-agenda-tags ()
      "Put the agenda tags by the right border of the agenda window."
      (setq org-agenda-tags-column (- 4 (window-width)))
      (org-agenda-align-tags))
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      "a" 'org-agenda
      "," 'counsel-org-tag-agenda
      "Cc" 'org-agenda-clock-cancel
      "Ci" 'org-agenda-clock-in
      "Co" 'org-agenda-clock-out
      "dd" 'org-agenda-deadline
      "ds" 'org-agenda-schedule
      "ie" 'org-agenda-set-effort
      "ip" 'org-agenda-set-property
      "it" 'org-agenda-set-tags
      "sr" 'org-agenda-refile
      "sc" 'org-copy
      )
    )

;;;; Reference settings
;;;;; bibtex settings
  (with-eval-after-load 'ivy-bibtex
;;;;;; bibtex-completion customize function
    (defun bibtex-completion-find-pdf-in-library (key-or-entry)
      "Searches the directories in `bibtex-completion-library-path' for a
PDF whose names is composed of the BibTeX key plus \".pdf\".  The
path of the first matching PDF is returned."
      (interactive)
      (let* ((key (if (stringp key-or-entry)
                      key-or-entry
                    (bibtex-completion-get-value "=key=" key-or-entry)))
             (key (s-replace ":" "" key))
             (path (-first 'f-file?
                           (--map (f-join it (s-concat key ".pdf"))
                                  (-flatten (list bibtex-completion-library-path))))))
        (when path (list path))))

    (defun bibtex-completion-open-uri (keys)
      "Open the associated URL or DOI in a browser."
      (dolist (key keys)
        (let* ((entry (bibtex-completion-get-entry key))
               (uri (bibtex-completion-get-value "uri" entry))
               (uri (s-replace "\\url{" "" uri))
               (uri (s-replace "}" "" uri))
               )
          (start-process "open papers" nil "/usr/bin/open" uri)
          )))

    ;; (helm-bibtex-helmify-action bibtex-completion-open-uri helm-bibtex-open-papers)
    ;; (helm-delete-action-from-source "Open Entry in Papers 3" helm-source-bibtex)
    ;; (helm-add-action-to-source "Open Entry in Papers 3" 'helm-bibtex-open-papers helm-source-bibtex 0)
;;;;;; Ivy-bibtex customize function
    (ivy-bibtex-ivify-action bibtex-completion-open-uri ivy-bibtex-open-papers)
    (setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)
    (ivy-set-actions
     'ivy-bibtex '(
                   ("p" ivy-bibtex-open-papers "Open in Papers")
                   ("n" ivy-bibtex-edit-notes "Edit notes")
                   ("c" ivy-bibtex-insert-citation "Insert citation")
                   ("u" ivy-bibtex-open-url-or-doi "Open URL or DOI in browser")
                   ("r" ivy-bibtex-insert-reference "Insert Reference")
                   ("b" ivy-bibtex-insert-key "Insert Bibtex Key")
                   )
     )

    (setq bibtex-completion-format-citation-functions
          '((org-mode      . bibtex-completion-format-citation-pandoc-citeproc)
            (default       . bibtex-completion-format-citation-default)))
    )

;;;;; Org-ref settings
  (with-eval-after-load 'org-ref-ivy

    ;;   ;; (defun my/org-ref-open-pdf-at-point ()
    ;;   ;;   "Open the pdf for bibtex key under point if it exists."
    ;;   ;;   (interactive)
    ;;   ;;   (let* ((results (org-ref-get-bibtex-key-and-file))
    ;;   ;;          (key (car results))
    ;;   ;;          (pdf-file (car (bibtex-completion-find-pdf key))))
    ;;   ;;     (if (file-exists-p pdf-file)
    ;;   ;;         (org-open-file pdf-file)
    ;;   ;;       (message "No PDF found for %s" key)))
    ;;   ;;   )
    ;; (defun my/org-ref-open-papers-at-point ()
    ;;   "Open the pdf for bibtex key under point if it exists."
    ;;   (interactive)
    ;;   (let* ((results (org-ref-get-bibtex-key-and-file))
    ;;          (key (car results))
    ;;          (entry (bibtex-completion-get-entry key))
    ;;          (uri (bibtex-completion-get-value "uri" entry))
    ;;          (uri (s-replace "\\url{" "" uri))
    ;;          (uri (s-replace "}" "" uri)))
    ;;     (start-process "open papers" nil "/usr/bin/open" uri)
    ;;     )
    ;;   )

    ;;   (defun org-ref-open-bibtex-pdf ()
    ;;     "Open the pdf for bibtex key under point if it exists."
    ;;     (interactive)
    ;;     (let* ((results (org-ref-get-bibtex-key-and-file))
    ;;            (key (car results))
    ;;            (entry (bibtex-completion-get-entry key))
    ;;            (uri (bibtex-completion-get-value "uri" entry))
    ;;            (uri (s-replace "\\url{" "" uri))
    ;;            (uri (s-replace "}" "" uri)))
    ;;       (start-process "open papers" nil "/usr/bin/open" uri)
    ;;       )
    ;;     )


    ;;   ;; (add-to-list 'org-ref-helm-user-candidates '("Open pdf in papers" . (lambda () (my/org-ref-open-papers-at-point))) t)
    (setf (cdr (assoc "p" org-ref-ivy-cite-actions)) '(ivy-bibtex-open-papers "Open in Papers"))
    ;;   ;; (ivy-set-actions
    ;;   ;;  'org-ref-ivy-insert-cite-link '(
    ;;   ;;                                  ("p" my/org-ref-open-papers-at-point "Open in Papers")
    ;;   ;;                                  ("n" or-ivy-bibtex-open-notes "Open notes")
    ;;   ;;                                  ("u" or-ivy-bibtex-open-url "Open url")
    ;;   ;;                                  ("d" or-ivy-bibtex-open-doi "Open doi")
    ;;   ;;                                  ("k" or-ivy-bibtex-set-keywords "Add keywords")
    ;;   ;;                                  ("f" or-ivy-bibtex-insert-formatted-citation "Insert formatted citation")
    ;;   ;;                                  ("F" or-ivy-bibtex-copy-formatted-citation "Copy formatted citation")
    ;;   ;;                                  ("a" or-ivy-bibtex-add-entry "Add bibtex entry")
    ;;   ;;                ))
    )

;;;; Misc
;;;;; Ivy
  (with-eval-after-load 'ivy

    (setq
     ivy-use-virtual-buffers t
     ivy-re-builders-alist '((t . ivy--regex-plus)))

    (define-key ivy-minibuffer-map (kbd "<C-return>") 'ivy-call)
    ;; (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
    ;; (setq ivy-virtual-abbreviate 'full ivy-rich-switch-buffer-align-virtual-buffer t)
    ;; (setq ivy-rich-abbreviate-paths t)
    (setq swiper-font-lock-exclude
          '(package-menu-mode
            notmuch-tree-mode
            notmuch-search-mode
            gnus-summary-mode
            gnus-article-mode
            gnus-group-mode
            emms-playlist-mode
            emms-stream-mode
            erc-mode
            org-agenda-mode
            dired-mode
            jabber-chat-mode
            elfeed-search-mode
            elfeed-show-mode
            fundamental-mode
            Man-mode
            woman-mode
            mu4e-view-mode
            mu4e-headers-mode
            help-mode
            debbugs-gnu-mode
            occur-mode
            occur-edit-mode
            bongo-mode
            bongo-library-mode
            bongo-playlist-mode
            eww-mode
            twittering-mode
            vc-dir-mode
            rcirc-mode
            sauron-mode
            w3m-mode)
          )
    (setq counsel-org-goto-display-style 'path)
    (setq counsel-org-goto-separator " ➜ ")
    (setq counsel-org-goto-face-style 'org)
    )
;;;;; Notmuch
;;;;; Mu4e
  ;;   (with-eval-after-load 'mu4e-alert
  ;;     (mu4e-alert-set-default-style 'notifier))   ; For Mac OSX (through the ; terminal notifier app)
  ;;   (with-eval-after-load 'mu4e
  ;;     (setq mu4e-maildir "~/.mail"
  ;;           mu4e-trash-folder "/trash"
  ;;           mu4e-sent-folder "/sent"
  ;;           mu4e-refile-folder "/all"
  ;;           mu4e-get-mail-command "mbsync gmail"
  ;;           mu4e-update-interval nil
  ;;           mu4e-html2text-command "w3m -dump -T text/html"
  ;;           mu4e-enable-notifications t
  ;;           mu4e-compose-signature-auto-include nil
  ;;           mu4e-view-show-images t
  ;;           mu4e-view-show-addresses t)

  ;;     (setq mu4e-maildir-shortcuts
  ;;           '(("/all" . ?a)
  ;;             ("/trash" . ?t)
  ;;             ))
  ;;     (fset 'my-move-to-trash "mt")
  ;;     (define-key mu4e-headers-mode-map (kbd "d") 'my-move-to-trash)
  ;;     (define-key mu4e-view-mode-map (kbd "d") 'my-move-to-trash)
  ;;     (setq mu4e-change-filenames-when-moving t)
  ;;     (setq mu4e-bookmarks
  ;;           `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
  ;;             ("date:today..now" "Today's messages" ?t)
  ;;             ("date:7d..now" "Last 7 days" ?w)
  ;;             ("mime:image/*" "Messages with images" ?p)
  ;;             (,(mapconcat 'identity
  ;;                          (mapcar
  ;;                           (lambda (maildir)
  ;;                             (concat "maildir:" (car maildir)))
  ;;                           mu4e-maildir-shortcuts) " OR ")
  ;;              "All inboxes" ?i)))
  ;;     (setq message-send-mail-function 'message-send-mail-with-sendmail)
  ;;     (setq send-mail-function 'sendmail-send-it)
  ;;     (setq sendmail-program "/usr/local/bin/msmtpq")

  ;;     (defun open-message-with-mail-app ()
  ;;       (interactive)
  ;;       (let* ((msg-path (plist-get (mu4e-message-at-point) :path))
  ;;              (temp (make-temp-file "mu4e-message-" nil ".eml")))
  ;;         (shell-command-to-string (format "cp '%s' '%s'; open '%s' -a Mail; l/bin/rm '%s'" msg-path temp temp temp))))

  ;;     (define-key mu4e-headers-mode-map (kbd "i") 'open-message-with-mail-app)
  ;;     (define-key mu4e-headers-mode-map (kbd "TAB") 'mu4e-headers-toggle-thread-folding)
  ;;     (define-key mu4e-headers-mode-map (kbd "<backtab>") 'mu4e-headers-fold-all)
  ;;     (define-key mu4e-view-mode-map (kbd "i") 'open-message-with-mail-app)

  ;;     )


;;;;; Toggles
  (evil-snipe-override-mode 1)

;;;;; Dired
  (with-eval-after-load 'dired
    (require 'ivy-dired-history)
    ;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    (defun xfu-dired-rsync (dest)
      (interactive
       (list
        (expand-file-name
         (read-file-name
          "Rsync to:"
          (dired-dwim-target-directory)))))
      ;; store all selected files into "files" list
      (let ((files (dired-get-marked-files
                    nil current-prefix-arg))
            ;; the rsync command
            (tmtxt/rsync-command
             "rsync -arvz --progress "))
        ;; add all selected file names as arguments
        ;; to the rsync command
        (dolist (file files)
          (setq tmtxt/rsync-command
                (concat tmtxt/rsync-command (shell-quote-argument file) " ")))
        ;; append the destination
        (setq tmtxt/rsync-command
              (concat tmtxt/rsync-command
                      (shell-quote-argument dest)))
        ;; run the async shell command
        (async-shell-command tmtxt/rsync-command "*rsync*")
        ;; finally, switch to that window
        (other-window 1)))

    ;; (define-key dired-mode-map "Y" 'xfu-dired-rsync)
    (define-key dired-mode-map "f" 'dired-narrow)
    (define-key dired-mode-map "," 'dired))

;;;;; EWW
  (with-eval-after-load 'shr
    (require 'shr-tag-pre-highlight)
    (add-to-list 'shr-external-rendering-functions
                 '(pre . shr-tag-pre-highlight)))

  (when (version< emacs-version "26")
    (with-eval-after-load 'eww
      (advice-add 'eww-display-html :around
                  'eww-display-html--override-shr-external-rendering-functions)))

;;;;; Org-image
  ;; (load "~/.emacs.d/private/personal/local/org-image/org-image.el")
  )


;;; Customize
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-dabbrev-downcase nil t)
 '(company-dabbrev-ignore-case nil t)
 '(company-idle-delay 0.2 t)
 '(company-minimum-prefix-length 2 t)
 '(company-quickhelp-mode t)
 '(company-require-match nil t)
 '(company-tooltip-align-annotations t)
 '(company-transformers
   (quote
    (spacemacs//company-transformer-cancel company-sort-by-occurrence)))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("e3aa063583d12b9026aa0e12ef75db105355ab3ff2f345d3d077b17f3af2209a" default)))
 '(display-line-number-width nil)
 '(display-line-numbers nil)
 '(display-line-numbers-current-absolute nil)
 '(display-time-day-and-date nil)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(elfeed-search-title-max-width 120)
 '(eshell-modules-list
   (quote
    (eshell-alias eshell-banner eshell-basic eshell-cmpl eshell-dirs eshell-glob eshell-hist eshell-ls eshell-pred eshell-prompt eshell-script eshell-term eshell-tramp eshell-unix)))
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters . t)
     (ess-fl-keyword:= . t)
     (ess-R-fl-keyword:F&T . t)
     (ess-R-fl-keyword:%op% . t))))
 '(ess-eval-visibly (quote nowait))
 '(evil-org-key-theme
   (quote
    (navigation textobjects insert rsi additional todo leader)) t)
 '(evil-want-Y-yank-to-eol nil)
 '(eww-search-prefix "https://www.google.com/search?q=")
 '(exec-path-from-shell-check-startup-files nil)
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#d6d6d6" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-resize-pixelwise t)
 '(fringe-mode 4 nil (fringe))
 '(git-gutter+-hide-gutter nil t)
 '(git-gutter+-modified-sign " " t)
 '(global-git-gutter+-mode t)
 '(global-hl-line-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")) t)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(ispell-program-name "aspell")
 '(jdee-db-active-breakpoint-face-colors ("#1B2229" . "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors ("#1B2229" . "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors ("#1B2229" . "#3B3F46"))
 '(line-spacing 0.2)
 '(magit-diff-use-overlays nil)
 '(modern-theme-comment-bg t)
 '(notmuch-archive-tags (quote ("-inbox" "-unread" "+archived")))
 '(notmuch-fcc-dirs nil)
 '(notmuch-hello-sections
   (quote
    (notmuch-hello-insert-saved-searches notmuch-hello-insert-alltags)))
 '(notmuch-saved-searches
   (quote
    ((:name "fantom" :query "(to:kevin or from:kevin or to:qin or from:qin) and ((fantom near project) or (gentle near project) or (deep learning)) " :key "f")
     (:name "n2o" :query "(from:shanglong or from:williamkkwu) or ((from:kevin or to:kevin or to:shanglong or to:williamkkwu) and (medip or MeDIP or n2o or rat))" :key "n")
     (:name "hscr" :query "(from:hku or from:ellyngan or from:clara) or ((from:kevin or to:kevin or to:hku) and (hscr or hirschsprung or hku or variants))" :key "h")
     (:name "inbox" :query "tag:inbox" :key "i")
     (:name "unread" :query "tag:unread and tag:new" :key "u")
     (:name "sent" :query "from:fuxialexander@gmail.com" :key "t")
     (:name "drafts" :query "folder:drafts" :key "d"))))
 '(notmuch-show-logo nil)
 '(notmuch-tag-formats
   (quote
    (("unread"
      (propertize tag
                  (quote face)
                  (quote notmuch-tag-unread)))
     ("flagged"
      (propertize tag
                  (quote face)
                  (quote notmuch-tag-flagged))))))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote hyper))
 '(ns-function-modifier (quote none))
 '(org-agenda-block-separator "")
 '(org-agenda-clockreport-parameter-plist
   (quote
    (:link t :maxlevel 3 :fileskip0 t :stepskip0 t :tags "-COMMENT")))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda ""
               ((org-agenda-overriding-header " Week Agenda
")))
       (alltodo ""
                ((org-agenda-skip-function
                  (quote
                   (org-agenda-skip-entry-if
                    (quote scheduled))))
                 (org-agenda-overriding-header " TODOs
")
                 (org-agenda-sorting-strategy
                  (quote
                   (todo-state-up deadline-up))))))
      ((org-agenda-tag-filter-preset
        (quote
         ("-COMMENT"))))))))
 '(org-agenda-dim-blocked-tasks (quote invisible))
 '(org-agenda-export-html-style
   "    <style type=\"text/css\">
    <!--
      pre {
        font-family: \"Operator Mono\";
        line-height: 1.5
      }
      body {
        color: #bbc2cf;
        font-family: \"Operator Mono\";
        background-color: #21242b;
        line-height: 1.5
      }
      .custom {
        /* (:inherit default :foreground \"#ff9d00\" :weight normal (:line-width 1 :color \"#ff9d00\" :style nil)) */
        color: #6fa1f2;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .custom-1 {
        /* (:inherit default :foreground \"#d34a65\" :weight normal (:line-width 1 :color \"#d34a65\" :style nil)) */
        color: #6f2faf;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .custom-2 {
        /* (:inherit default :foreground \"#d34a65\" :weight normal (:line-width 1 :color \"#d34a65\" :style nil)) */
        color: #ff9d00;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .custom-3 {
        /* (:inherit default :foreground \"#d34a65\" :weight normal (:line-width 1 :color \"#d34a65\" :style nil)) */
        color: #15c188;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .custom-4 {
        /* (:inherit default :foreground \"#d34a65\" :weight normal (:line-width 1 :color \"#d34a65\" :style nil)) */
        color: #d34a65;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .org-agenda-calendar-event {
        /* org-agenda-calendar-event */
        color: #bbc2cf;
        font-family: \"Operator Mono\";
        background-color: #21242b;
        line-height: 1.5
      }
      .org-agenda-current-time {
        /* org-agenda-current-time */
        color: #ffffff;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .org-agenda-date {
        /* org-agenda-date */
        color: #87cefa;
        font-family: \"Input Mono Compressed\";
        font-weight: normal;
        font-style: italic;
        line-height: 1.5
      }
      .org-agenda-date-today {
        /* org-agenda-date-today */
        color: #87cefa;
        font-family: \"Input Mono Compressed\";
        font-weight: normal;
        font-style: italic;
        line-height: 1.5
      }
      .org-agenda-date-weekend {
        /* org-agenda-date-weekend */
        color: #87cefa;
        font-family: \"Input Mono Compressed\";
        font-weight: normal;
        font-style: italic;
        line-height: 1.5
      }
      .org-agenda-structure {
        /* org-agenda-structure */
        color: #87cefa;
        font-family: \"Input Mono Compressed\";
        font-weight: normal;
        font-style: italic;
        line-height: 1.5
      }
      .org-agenda-done {
        /* org-agenda-done */
        color: #5B6268;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .org-scheduled-previously {
        /* org-scheduled-previously */
        color: #00b2ee;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .org-tag {
        /* org-tag */
        color: #98be65;
        font-weight: normal;
        font-family: \"Operator Mono\";
        font-style: italic;
        line-height: 1.5
      }
      .org-time-grid {
        /* org-time-grid */
        color: #5B6268;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .org-upcoming-deadline {
        /* org-upcoming-deadline */
        color: #ff6eb4;
        font-family: \"Operator Mono\";
        font-weight: normal;
        line-height: 1.5
      }
      .org-warning {
        /* org-warning */
        color: #ff3e96;
        font-family: \"Operator Mono\";
        font-weight: normal;
        font-style: italic;
        line-height: 1.5
      }

      a {
        color: inherit;
        background-color: inherit;
        font: inherit;
        text-decoration: inherit;
        line-height: 1.5
      }
      a:hover {
        text-decoration: underline;
        line-height: 1.5
      }
    -->
    </style>")
 '(org-agenda-files (quote ("/Users/xfu/Dropbox/org/")))
 '(org-agenda-log-mode-items (quote (closed clock)))
 '(org-agenda-restore-windows-after-quit t t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
 '(org-agenda-start-with-log-mode nil)
 '(org-clock-clocktable-default-properties (quote (:maxlevel 3 :scope agenda :tags "-COMMENT")))
 '(org-clocktable-defaults
   (quote
    (:maxlevel 3 :lang "en" :scope file :block nil :wstart 1 :mstart 1 :tstart nil :tend nil :step nil :stepskip0 t :fileskip0 t :tags "-COMMENT" :emphasize nil :link nil :narrow 40! :indent t :formula nil :timestamp nil :level nil :tcolumns nil :formatter nil)))
 '(org-download-image-dir "./image/")
 '(org-download-image-html-width 500)
 '(org-download-screenshot-method "screencapture -i %s")
 '(org-enforce-todo-dependencies t)
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-hide-block-startup t)
 '(org-image-actual-width 800 t)
 '(org-latex-packages-alist
   (quote
    (("" "color" t)
     ("" "minted" t)
     ("" "parskip" t)
     ("" "tikz" t)
     ("" "tabularx" t))))
 '(org-modules
   (quote
    (org-bibtex org-docview org-info org-protocol org-mac-link org-notmuch)))
 '(org-outline-path-complete-in-steps nil)
 '(org-pandoc-options (quote ((standalone . t) (self-contained . t))))
 '(org-pomodoro-finished-sound
   "/Users/xfu/.emacs.d/elpa/org-pomodoro-20161119.226/resources/bell.wav")
 '(org-pomodoro-finished-sound-p nil)
 '(org-pomodoro-long-break-sound-p nil)
 '(org-pomodoro-short-break-sound-p nil)
 '(org-preview-latex-default-process (quote dvisvgm))
 '(org-refile-use-outline-path (quote file))
 '(org-startup-with-inline-images nil t)
 '(org-tag-persistent-alist
   (quote
    (("communication" . 99)
     ("logs" . 108)
     ("organize" . 111)
     ("analysis" . 97)
     ("read" . 114)
     ("idea" . 105))))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
     (sequence "WAIT(w!)" "|" "KILL(k!)"))))
 '(package-selected-packages
   (quote
    (popwin window-purpose shackle spinner outorg ht alert log4e gntp notmuch language-detection parsebib imenu-list hydra git-gutter+ git-gutter fringe-helper flyspell-correct flycheck magit magit-popup git-commit with-editor smartparens iedit anzu highlight ctable ess julia-mode org-plus-contrib elfeed dired-hacks-utils diminish pkg-info epl counsel swiper pos-tip company bind-map bind-key biblio biblio-core yasnippet packed auctex async anaconda-mode pythonic f dash s memoize font-lock+ avy auto-complete popup org-brain highlight-numbers evil-nerd-commenter counsel-projectile color-identifiers-mode evil ivy markdown-mode yapfify xterm-color ws-butler winum which-key wgrep volatile-highlights uuidgen use-package unfill undo-tree toc-org sx string-inflection smex smeargle shrink-path shr-tag-pre-highlight shell-pop reveal-in-osx-finder restart-emacs request ranger rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort projectile prodigy prettify-utils pip-requirements persp-mode pcre2el pbcopy password-generator parent-mode paradox pandoc-mode ox-twbs ox-pandoc outshine osx-trash osx-dictionary orgit org-super-agenda org-present org-pomodoro org-edit-latex org-download org-bullets open-junk-file ob-async notmuch-labeler mwim multi-term move-text modern-light-theme modern-dark-theme macrostep live-py-mode link-hint launchctl langtool kurecolor ivy-purpose ivy-hydra ivy-dired-history ivy-bibtex insert-shebang info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses hide-comnt help-fns+ goto-chg google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ fuzzy flyspell-correct-ivy flycheck-pos-tip flycheck-bashate flx fish-mode fill-column-indicator eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-object-popup ess-R-data-view eshell-z eshell-prompt-extras eshell-git-prompt esh-help elisp-slime-nav elfeed-org editorconfig dumb-jump dired-narrow diff-hl cython-mode company-statistics company-shell company-quickhelp company-auctex company-anaconda column-enforce-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk all-the-icons aggressive-indent adaptive-wrap ace-window ace-link ac-ispell)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(powerline-default-separator (quote arrow-fade))
 '(powerline-height 22 t)
 '(projectile-git-ignored-command "git ls-files -zcoi --exclude-standard | sed 's/ /\\\\ /g'")
 '(projectile-globally-ignored-file-suffixes (quote ("svg" "pdf" "png")))
 '(projectile-indexing-method (quote alien))
 '(python-shell-interpreter "python" t)
 '(python-shell-interpreter-args "--simple-prompt -i" t)
 '(safe-local-variable-values (quote ((eval progn (pp-buffer) (indent-buffer)))))
 '(send-mail-function (quote mailclient-send-it))
 '(sendmail-program "/usr/local/bin/msmtpq")
 '(shr-tag-pre-highlight-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . fundamental)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh)
     ("emacslisp" . emacs-lisp)
     ("R" . r-mode))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(split-height-threshold 100)
 '(split-width-threshold 100)
 '(tool-bar-mode nil)
 '(tramp-remote-path
   (quote
    ("/uac/gds/xfu/bin" "/research/kevinyip10/xfu/miniconda3/bin" "/research/kevinyip10/xfu/miniconda2/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin")))
 '(truncate-lines t)
 '(user-mail-address "fuxialexander@gmail.com")
 '(vc-annotate-background "#181e26")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#98be65")
     (40 . "#b4be6c")
     (60 . "#d0be73")
     (80 . "#ECBE7B")
     (100 . "#e6ab6a")
     (120 . "#e09859")
     (140 . "#da8548")
     (160 . "#d38079")
     (180 . "#cc7cab")
     (200 . "#c678dd")
     (220 . "#d974b7")
     (240 . "#ec7091")
     (260 . "#ff6c6b")
     (280 . "#d6696a")
     (300 . "#ad6769")
     (320 . "#836468")
     (340 . "#5B6268")
     (360 . "#5B6268"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(window-divider-default-bottom-width 0)
 '(window-divider-default-places t)
 '(window-divider-default-right-width 1)
 '(window-divider-mode t)
 '(window-resize-pixelwise t)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-search-feed-face ((t (:foreground "#CFD838" :family "Input mono compressed"))))
 '(elfeed-search-tag-face ((t (:foreground "#80CABF" :family "input mono compressed"))))
 '(org-agenda-structure ((t (:inherit bold :foreground "#8CB6E1" :overline t :underline t :slant italic :family "input mono compressed"))))
 '(org-column ((t (:background "#000000" :foreground "#ECEBE7" :family "Input mono narrow"))))
 '(org-table ((t (:background "#000000" :foreground "#ECEBE7" :family "input mono narrow")))))
)

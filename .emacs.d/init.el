
;; start package.el with emacs
(require 'package)
;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; initialize package.el
(package-initialize)


;; add local lisp folder to load-path
(add-to-list 'load-path "~/.emacs.d/lisp")

;; set default directory (e.g. for C-x-s and C-x-f)
(setq default-directory "~/")

;; emacs startup message (nil/t)
(setq inhibit-startup-screen nil)
;;(setq inhibit-startup-message nil)

(global-auto-revert-mode 1)

;; ;; load webkit
;; (add-to-list 'load-path "~/.emacs.d/webkit/")
;; (require 'epc)
;; (load "webkit.el")

;; UTF-8 everywhere (is probably the default already)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; stop the silly emacs default scrolling
(setq scroll-step 1)
(setq hscroll-step 1)
(setq scroll-conservatively 50)
;; start scrolling when 3 lines from top/bottom
(setq scroll-margin 3)
;; move cursor, not buffer (?)
(setq scroll-preserve-screen-position 't)


;; molokai theme linum style
(setq molokai-theme-kit t)

;; disable menu/tool/scroll bars
;;(when (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
;;(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(set-scroll-bar-mode 'right)

;; always turn on hi-fi font-lock
(require 'font-lock)
(if (fboundp 'global-font-lock-mode) (global-font-lock-mode t))
(setq font-lock-mode-maximum-decoration t)


(setq-default c-basic-offset 8
              indent-tabs-mode t)

(setq-default
 tab-width 8
 )

;; tab width
;; (setq-default tab-width 8)
;; (setq tab-stop-list (number-sequence 4 120 4)

;; (progn
;;   ;; Make whitespace-mode with very basic background coloring for whitespaces.
;;   ;; http://ergoemacs.org/emacs/whitespace-mode.html
;;   (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))

;;   ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
;;   (setq whitespace-display-mappings
;;         ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
;;         '(
;;           (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
;;           (newline-mark 10 [182 10]) ; LINE FEED,
;;           (tab-mark 9 [8594 9] [92 9]) ; tab
;;           )))

;; ;; spaces, not tabs
;; (setq-default indent-tabs-mode t)
;; (setq indent-tabs-mode nil)

;; ;; even for xml
;; (setq-default nxml-child-indent 4)
;; (setq-default nxml-attribute-indent 4)

;; allow S-cursor to mark a region (not really, rather: highlight marked region)
(setq transient-mark-mode t)

;; show (ugly) trailing whitespace
(setq-default show-trailing-whitespace t)

;; show size of buffer
(setq size-indication-mode t)

;; show column number
(setq column-number-mode t)

;; do not automatically add new lines at end of buffer (when pressing <down> at end of file)
(setq next-line-add-newlines nil)

;; show 24h clock and date
(display-time)
(setq-default display-time-day-and-date t)
(setq display-time-24hr-format t)

;; make C-k kill whole line instead of just to end of line (when at beginning of line)
(setq kill-whole-line t)

;; fringes (proper one at the right, small one left just for some padding)
(set-fringe-style (quote (2 . 8)))

;; remember where the cursor was in a file, store in ~/.emacs.d/places
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; remember recently visited files (File->Open Recent), and save in ~/.emacs.d/recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-save-file (concat user-emacs-directory "recentf"))

;; highlight all places matching the mouse selection
                                        ;(require 'cl)
                                        ;(require 'msearch)
                                        ;(msearch-mode 1);
                                        ;(add-hook 'prog-mode-hook 'msearch-mode)

;; save desktop (open files) and load again on start, use only one desktop, save on file open, save more stuff with it
(require 'desktop)
(desktop-save-mode t)
(setq desktop-save t)
(setq desktop-load-locked-desktop t)
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'Apropos-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
                                        ;(add-to-list 'desktop-modes-not-to-save 'fundamental-mode) ; nope!
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
                                        ;(setq desktop-dirname user-emacs-directory)
(setq desktop-base-file-name "desktop")
(setq desktop-base-lock-name "desktop.lock")
                                        ;(add-hook 'find-file-hook (lambda () (run-with-timer 5 nil (lambda () (setq desktop-file-modtime (nth 5
                                        ;    (file-attributes (desktop-full-file-name)))) (desktop-save user-emacs-directory)))))
(setq desktop-globals-to-save (append '(
                                        (extended-command-history . 30) (file-name-history . 100) (grep-history . 30) (compile-history . 30)
                                        (minibuffer-history . 50) (query-replace-history . 60) (read-expression-history . 60)
                                        (regexp-history . 60) (regexp-search-ring . 20) (search-ring . 20) (shell-command-history . 50)
                                        (evil-ex .100) tags-file-name register-alist)))
                                        ;(add-hook 'kill-emacs-hook (lambda () (setq desktop-file-modtime (nth 5 (file-attributes (desktop-full-file-name))))))

;; make mouse avoid the cursor
(cond (window-system (require 'avoid) (mouse-avoidance-mode 'animate)))

;; make buffer names unique when visiting multiple files with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; don't wrap long line
(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

;; set default fill-colum
(setq-default fill-column 80)

;; auto-fill-mode by default
(setq text-mode-hook 'turn-on-auto-fill)

;; highlight matching parenthese on cursor over
(show-paren-mode 1)

;; mouse yanks at cursor (instead of where clicked)
                                        ;(setq mouse-yank-at-point t)

;; more extensive apropos searches
(setq apropos-do-all t)

;; kill and yank also fills the x clipboard rather than just the primary selection
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq save-interprogram-paste-before-kill t)


;; use traditional selection behaviour
                                        ;(pc-selection-mode t) ;; Emacs < 24
(delete-selection-mode t) ;; Emacs >= 24
(setq select-active-regions nil) ;; Emacs >= 24
(setq pc-select-selection-keys-only t)
                                        ;(setq pc-select-meta-moves-sexps t)

;; ;; store versioned backups in ~/.emacs.d/backups
;; (setq backup-directory-alist '(("." . "~/.emacs.d/backups")) ; FIXME: why not: '(("." . '(concat user-emacs-directory "backups")))
;;       backup-by-copying t ; don't clobber symlinks
;;       delete-old-versions t
;;       kept-new-versions 15
;;       kept-old-versions 5
;;       version-control t)

(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt) (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)
                                        ;(standard-display-european t)
                                        ;(set-keyboard-coding-system 'utf-8)

(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'comment-inline-offset) 2)))

(add-hook 'c++-mode-hook
          (lambda () (set (make-local-variable 'comment-inline-offset) 2)))

;; (add-hook 'c-mode-hook
;;            (lambda () (set (make-local-variable 'comment-inline-offset) 3)))

;; org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; (setq org-agenda-files (list "~/my-priv-things/org/work.org"))
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (org-bullets-mode t)))

(setq org-hide-leading-stars t)

;; (setq org-src-fontify-natively t)


;; roslaunch highlighting
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))

;; make scripts executable on save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; make all yes/no prompts y/n instead
(fset 'yes-or-no-p 'y-or-n-p)

;; ask before quitting
(setq confirm-kill-emacs (quote y-or-n-p))

;; prefer cperl-mode over perl-mode
(defalias 'perl-mode 'cperl-mode)


;; want cscope..
;; (require 'xcscope)
;; (add-hook 'cperl-mode-hook 'cscope-minor-mode)
;; (setq cscope-database-regexps
;;       '(
;;                                         ;( "^/home/flip/CODENAME/"
;;                                         ;  ( t ) ;; do hierarchical search
;;                                         ;  ( "/tmp/cscope-CODENAME.out" ( "-q" ))
;;                                         ;  t ;; stop searching if found something already
;;                                         ;  ( "/tmp/cscope-ds.out" ("-d" "-I/opt/ds/include") )
;;                                         ;  )

;;                                         ;( "flip/CODENAME/"
;;                                         ;  ( "/home/flip/CODENAME" ("-q" "-k" "-I/opt/ds/include") ))

;;                                         ;( "flip/FW/CubETH_FW100/"
;;                                         ;  ( "/home/flip/FW/CubETH_FW100" ("-q" "-k") ))

;;                                         ;( "^/home/flip/ReleaseTestGUT/"
;;                                         ;  ( "/home/flip/ReleaseTestGUT" ("-q" "-k") ))

;;         ))

;; ;; want bookmarks
;; (require 'bm)
;; (setq bm-repository-file (concat user-emacs-directory "boomarks"))
;; (setq bm-buffer-persistence t) ; FIXME: does not seem to work

;; ;; want tabbar (FIXME: does weird file grouping)
;;                                         ;(require 'tabbar)
;;                                         ;(tabbar-mode)
;;                                         ;(setq tabbar-scroll-left-button (quote ((" <") " =")))
;;                                         ;(setq tabbar-scroll-right-button (quote ((" >") " =")))
;;                                         ;(setq tabbar-separator (quote ("  ")))
;;                                         ;(setq tabbar-use-images nil)

;; window title
(setq frame-title-format "GNU Emacs: % ")
                                        ;(setq my-frame-title-name (if buffer-file-name (replace-regexp-in-string (getenv "HOME") "~" (buffer-name)))
                                        ;(setq frame-title-format (concat "GNU Emacs: " my-frame-title-name))

;; highlight symbols (words)
(require 'highlight-symbol)
(setq highlight-symbol-mode t)


;; set height (in lines) of the compilation window
(setq compilation-window-height 15)

;; make color escape sequences work in shell frames
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

                                        ; by default we start in text mode.
(setq initial-major-mode (lambda () (text-mode) (turn-on-auto-fill) (font-lock-mode)))

;; ;; font
;; (set-default-font "DejaVu Sans Mono-10")

;; reuse existing frames (e.g. for the compilation buffer)
(setq display-buffer-reuse-frames t)

;; spell checking using aspell, and dictionary
(require 'ispell)
(setq ispell-program-name "aspell") ; use aspell (better than ispell)
(setq ispell-personal-dictionary (concat user-emacs-directory "dictionary"))
(setq ispell-dictionary "british")

;; allow scrolling while in search mode ; FIXME: WTF?
(setq isearch-allow-scroll t)

;; visually indicate empty lines after end of file in the left fringe thingy
(setq indicate-empty-lines t)

;; never make new frames
(setq pop-up-frames nil)
(setq pop-up-windows t)

;; hide-ifdef use shadow instead of folding
(require 'hideif)
(add-hook 'c-mode-hook 'hide-ifdef-mode)
(setq hide-ifdef-shadow t)

;; code folding
                                        ;(require 'hideshow)
                                        ;(add-hook 'c-mode-hook 'hs-minor-mode)
                                        ;(add-hook 'cperl-mode-hook 'hs-minor-mode)
                                        ;(require 'vimish-fold)
                                        ;(vimish-fold-global-mode 1)
                                        ;(setq vimish-fold-dir (concat user-emacs-directory "vimish"))
                                        ;(setq vimish-fold-header-width 120)

;; tramp use SFTP by default
(require 'tramp)
                                        ;(setq tramp-default-method "sftp")
(setq tramp-default-method "ssh")

;; support svn 1.7 (only one master .svn dir)
                                        ;(require 'vc-svn17)

;; version control (show backend messages, automatically follow symlinks, make local backup files)
(setq vc-command-messages t)
(setq vc-follow-symlinks t)
(setq vc-make-backup-files t)

;; ;; we're using ssh nowadays (not rsh)
;; (setq remote-shell-program "/usr/bin/ssh")

;; compilation
(require 'compile)
(add-hook 'c-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "make -C %s " (upward-find-file "Makefile"))))) ; FIXME: does not seem to work
(setq compilation-exit-message-function 'compilation-exit-autoclose)
(setq compilation-auto-jump-to-first-error nil)
(setq compilation-scroll-output t)

;; ;; start server
;; (load "server")
;; (unless (server-running-p) (server-start))

;; highlight surrounding parentheses
(require 'highlight-parentheses)
(add-hook 'c-mode-hook (lambda () (highlight-parentheses-mode)))
(add-hook 'perl-mode-hook (lambda () (highlight-parentheses-mode)))
(add-hook 'cperl-mode-hook (lambda () (highlight-parentheses-mode)))
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-parentheses-mode)))

;; ;; highlight columns beyond the magic boundary
;; (require 'highlight-80+)
;; (add-hook 'c-mode-hook '(lambda () (highlight-80+-mode) (setq fill-column 100)))
;; (add-hook 'perl-mode-hook '(lambda () (highlight-80+-mode) (setq fill-column 100)))
;; (add-hook 'cperl-mode-hook '(lambda () (highlight-80+-mode) (setq fill-column 100)))

;; different cursor based on mode
(add-hook 'post-command-hook '(lambda ()
                                (cond (buffer-read-only (set-cursor-color "grey") (setq cursor-type 'box))
                                      (overwrite-mode (set-cursor-color "red") (setq cursor-type 'hollow))
                                      (t (set-cursor-color "red") (setq cursor-type 'box)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; keyboard ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://ergoemacs.org/emacs/keyboard_shortcuts_examples.html
;; https://www.masteringemacs.org/article/mastering-key-bindings-emacs

;; ;; jump between matching parenthesis
;; ;; (global-set-key "%" 'match-paren)

(setq cc-other-file-alist
      '(("\\.c"   (".h"))
       ("\\.cpp"   (".h"))
       ("\\.h"   (".c"".cpp"))))

(setq ff-search-directories
      '("." "../src" "../include" "../../src" "../../include" ))

;; switch header/source
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

;; C-o switches to other window (if more than one window)
(global-set-key (kbd "C-o") 'other-window)

;; M-g to jump to line number
(global-set-key (kbd "M-g") 'goto-line)

;; M-up / M-down to scroll while keeping the cursor (as far as possible)
(global-set-key (kbd "<M-down>") 'scroll-down-keep-cursor) ; [M-down]
(global-set-key (kbd "<M-up>") 'scroll-up-keep-cursor)

;; C-right / C-left to jump words differently than default
                                        ;(global-set-key [C-right] 'geosoft-forward-word)
                                        ;(global-set-key [C-left] 'geosoft-backward-word)

;; hippie-expand instead of dabrev
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "<C-tab>") 'hippie-expand)

;; better buffer menu
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; swap regex/non-regex interactive search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; ;; window resize
;; (global-set-key (kbd "<C-kp-divide>") 'shrink-window-horizontally)
;; (global-set-key (kbd "<C-kp-multiply>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "<C-kp-subtract>") 'shrink-window)
;; (global-set-key (kbd "<C-kp-add>") 'enlarge-window)

;; ;; hide-show (code folding);
;;                                         ;(global-set-key (kbd "<f1>") 'hs-toggle-hiding)
;;                                         ;(global-set-key (kbd "<C-f1>") 'hs-hide-all)
;;                                         ;(global-set-key (kbd "<S-f2>") 'hs-show-all)
;; (global-set-key (kbd "<S-f1>") 'vimish-fold)
;; (global-set-key (kbd "<C-f1>") 'vimish-fold-delete)
;; (global-set-key (kbd "<f1>") 'vimish-fold-toggle)

;; magit
(global-set-key (kbd "<C-§>") 'magit-status)
(global-set-key [?\C-§] 'magit-status)
(global-set-key [?\C-§] 'magit-dispatch-popup)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x G") 'magit-dispatch-popup)

;; ;; bookmarks
;; (global-set-key (kbd "<C-f2>") 'bm-toggle)
;; (global-set-key (kbd "<f2>")   'bm-next)
;; (global-set-key (kbd "<S-f2>") 'bm-previous)

;; hide-show ifdef blocks
(global-set-key (kbd "<f3>") 'hide-ifdef-block)
(global-set-key (kbd "<S-f3>") 'show-ifdef-block)

;; highlight symbol
(global-set-key (kbd "<C-f4>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f4>") 'highlight-symbol-next)
(global-set-key (kbd "<S-f4>") 'highlight-symbol-prev)

;; refresh the buffer from the disk (prompt of modified)
(global-set-key (kbd "<f5>") '(lambda () "refresh buffer" (interactive) (revert-buffer t (not (buffer-modified-p)) t)))

;; ;; cscope
;; (define-key global-map (kbd "<f6>") 'cscope-find-this-symbol)
;; (define-key global-map (kbd "<C-f6>") 'cscope-find-global-definition)
;; (define-key global-map (kbd "<S-f6>") 'cscope-find-functions-calling-this-function)

;; ;; kill current buffer
;; (global-set-key (kbd "<f8>") 'kill-this-buffer)

;; ;; compilation
;; (global-set-key (kbd "<S-f9>") 'compile)
;; (global-set-key (kbd "<f9>") 'recompile)

;; line wrap, line numbering
(global-set-key (kbd "<f10>") 'toggle-truncate-lines)
(global-set-key (kbd "<S-f10>") 'linum-mode)

;; ;; cycle through buffers
;; (global-set-key (kbd "<f11>") 'yic-prev-buffer)
;; (global-set-key (kbd "<f12>") 'yic-next-buffer)

;; ;; tabbar
;; (global-set-key (kbd "<M-S-left>") 'tabbar-backward-tab)
;; (global-set-key (kbd "<M-S-right>") 'tabbar-forward-tab)
;; (global-set-key (kbd "<M-S-up>")    'tabbar-forward-group)
;; (global-set-key (kbd "<M-S-down>")  'tabbar-backward-group)

;; delete word forward and backwards
(global-set-key (kbd "<M-delete>") 'delete-word)
(global-set-key (kbd "<M-backspace>") 'backward-delete-word)

;; ;; also in ido mode
;; (add-hook 'ido-define-mode-map-hook ; FIXME: does not seem to work..
;;           (lambda () (define-key ido-mode-map [(meta backspace)] 'ido-delete-backward-updir)
;;             (define-key ido-mode-map [(control backspace)] 'ido-up-directory)))


;; ;; mouse (per "tick" scroll 5 lines, 1 line with shift, one page with ctrl)
;; (defun up-slightly () (interactive) (scroll-up 5))
;; (defun down-slightly () (interactive) (scroll-down 5))
;; (global-set-key [mouse-4] 'down-slightly)
;; (global-set-key [mouse-5] 'up-slightly)
;; (defun up-one () (interactive) (scroll-up 1))
;; (defun down-one () (interactive) (scroll-down 1))
;; (global-set-key [S-mouse-4] 'down-one)
;; (global-set-key [S-mouse-5] 'up-one)
;; (defun up-a-lot () (interactive) (scroll-up))
;; (defun down-a-lot () (interactive) (scroll-down))
;; (global-set-key [C-mouse-4] 'down-a-lot) ; like pgdn
;; (global-set-key [C-mouse-5] 'up-a-lot) ; like pgup

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; special modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; custom highlight ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'vhdl-mode-hook 'my-highlight-fixme)
(add-hook 'c-mode-common-hook 'my-highlight-fixme)
(add-hook 'cperl-mode-hook 'my-highlight-fixme)
(add-hook 'emacs-lisp-mode-hook 'my-highlight-fixme)
(add-hook 'LaTeX-mode-hook 'my-highlight-fixme)
(add-hook 'asm-mode-hook 'my-highlight-fixme)

;; ;; c ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq c-backslash-column 70)
(setq c-backslash-max-column 79)
(setq c-font-lock-extra-types (quote ("FILE" "\\sw+_pt" "\\sw+_tp" "\\sw+_t" "bool" "complex" "imaginary" "Lisp_Object" "I" "I1" "I2" "I4" "U" "U1" "U2" "U4" "L" "L1" "L2" "L4" "R4" "R8" "CH" "C2" "C4" "C8" "reg")))
(setq c-hanging-braces-alist (quote ((brace-list-open before after) (brace-entry-open before after) (statement-cont before after) (substatement-open before after) (block-close . c-snug-do-while) (extern-lang-open after) (namespace-open after) (module-open after) (composition-open after) (inexpr-class-open after) (inexpr-class-close before))))
(setq c-hanging-colons-alist (quote set-from-style))
(setq c-offsets-alist (quote ((substatement-open . 0))))
(setq c-style-variables-are-local-p nil)
(setq c-set-style "bsd")
(setq c-default-style "bsd")
(setq c-hungry-delete-key nil) ; hungry deleting sucks a lot
;; (add-hook 'c-mode-common-hook ; fix broken switch/case indentation
;;           (lambda () (c-set-offset 'case-label +)(linum-mode)))
;; (font-lock-add-keywords 'c-mode '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)))

;; indentation (also for c++)
;; C-c C-s gives the label used below for a particular line, possible values are:
;; + (1 x basic offset), - (-1x), ++ (2x), -- (-2x), * (0.5x), / (-0.5x)
;; http://www.gnu.org/software/emacs/manual/html_mono/ccmode.html#Class-Symbols
;; http://www.gnu.org/software/emacs/manual/html_mono/ccmode.html#Customizing-Indentation
;; (setq c-basic-offset 4)
;; (c-set-offset 'case-label '+)
;; (c-set-offset 'inclass '+)
;; (c-set-offset 'access-label '-)
;; (c-set-offset 'topmost-intro '0)
;; (c-set-offset 'arglist-cont-nonempty '4)
;; (c-set-offset 'arglist-intro '4)
;; (c-set-offset 'statement-block-intro '4)
;; (c-set-offset 'defun-block-intro '4)

;; indentation
;; (setq indent-line-function 'insert-tab)

;; c++11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; http://stackoverflow.com/questions/8549351/c11-mode-or-settings-for-emacs
(font-lock-add-keywords 'c++-mode
                        '(;; complete some fundamental keywords
                          ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
                          ;; namespace names and tags - these are rendered as constants by cc-mode
                          ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
                          ;;  new C++11 keywords
                          ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
                          ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
                          ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
                          ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
                          ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
                          ;; hexadecimal numbers
                          ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
                          ;; integer/float/scientific numbers
                          ;;("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
                          ("\\<[-+]?[0-9]*\\.?[0-9]+\\([uUlL]+\\|[eE][-+]?[0-9]+\\)?[fFlL]?\\>" . font-lock-constant-face)
                          ;; c++11 string literals
                          ;;       L"wide string"
                          ;;       L"wide string with UNICODE codepoint: \u2018"
                          ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
                          ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
                          ;;       R"(user-defined literal)"
                          ;;       R"( a "quot'd" string )"
                          ;;       R"delimiter(The String Data" )delimiter"
                          ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
                          ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
                          (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
                          (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

                          ;; user-defined types (rather project-specific)
                          ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
                          ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
                          ))


;; perl ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq cperl-auto-newline nil)
(setq cperl-brace-offset -2)
(setq cperl-electric-keywords nil)
(setq cperl-extra-newline-before-brace-multiline t)
;; (setq cperl-indent-comment-at-column-0 t)
;; (setq cperl-indent-level 4)
(setq cperl-invalid-face (quote trailing-whitespace))

;; Octave ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist (cons '("\\.m\\'" . octave-mode) auto-mode-alist))
(add-hook 'inferior-octave-mode-hook (lambda ()
                                       (turn-on-font-lock)
                                       (define-key inferior-octave-mode-map [up]   'comint-previous-input)
                                       (define-key inferior-octave-mode-map [down] 'comint-next-input)))

;; css ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css\\'" . css-mode) auto-mode-alist))

;; php ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'php-mode "php-mode")
(setq auto-mode-alist (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(add-hook 'php-mode-hook (lambda () (c-set-style "linux")))

;; gnuplot ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; funky functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; scroll text one line up/down while keeping the cursor
(defun scroll-up-keep-cursor () (interactive) (scroll-up 1))
(defun scroll-down-keep-cursor () (interactive) (scroll-down 1))

;; move one word forward / backward, leave cursor at start of word
;; instead of emacs default end of word, treat _ as part of word
(defun geosoft-forward-word () (interactive)
  (forward-char 1) (backward-word 1) (forward-word 2) (backward-word 1) (backward-char 1)
  (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word)) (t (forward-char 1))))
(defun geosoft-backward-word () (interactive)
  (backward-word 1) (backward-char 1)
  (cond ((looking-at "_") (geosoft-backward-word)) (t (forward-char 1))))

;; functions to change line ending characters, like flip(1)
(defun flip-unix ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))
(defun flip-dos ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))
(defun flip-mac ()
  "Change the current buffer to Latin 1 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-mac t))

;; highlight FIXME, TODO, XXX, !!!
(defun my-highlight-fixme ()
  (interactive)
  (font-lock-mode 1)
  (font-lock-add-keywords
   nil '(("\\<\\(todo\\|FIXME\\|TODO\\|XXX\\|!!!\\)" 1 font-lock-warning-face prepend))))

;; jump cursor between matching parenthesis
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; ;; switch to next/previous buffer
;; (defun yic-ignore (str)
;;   (or
;;    (string-match "\\*Buffer List\\*" str)
;;    (string-match "^TAGS" str)
;;    (string-match "^\\*Completions\\*$" str)
;;    (string-match "^ " str)
;;    (memq str (mapcar (lambda (x) (buffer-name (window-buffer (frame-selected-window x)))) (visible-frame-list)))))
;; (defun yic-next (ls)
;;   "Vai para o proximo buffer tirando os que estao em ignore."
;;   (let* ((ptr ls) bf bn go)
;;     (while (and ptr (null go))
;;       (setq bf (car ptr)  bn (buffer-name bf))
;;       (if (null (yic-ignore bn)) (setq go bf) (setq ptr (cdr ptr))))
;;     (if go (switch-to-buffer go))))
;; (defun yic-prev-buffer ()
;;   "Vai para o buffer anterior na janela atual."
;;   (interactive) (yic-next (reverse (buffer-list))))
;; (defun yic-next-buffer ()
;;   "Vai para o proximo buffer, na janela atual."
;;   (interactive) (bury-buffer (current-buffer)) (yic-next (buffer-list)))

;; function to count words in a region
(defun count-words-region (beginning end)
  "Print number of words in the region. Words are defined as at
least one word-constituent character followed by at least one
character that is not a word-constituent. The buffer's syntax
table determines which characters these are."
  (interactive "r")
  (message "Counting words in region.. ")
  (save-excursion (goto-char beginning)
                  (let ((count 0))
                    (while (< (point) end)
                      (re-search-forward "\\w+\\W*")
                      (setq count (1+ count)))
                    (cond ((zerop count) (message "The region does NOT have any words."))
                          ((= 1 count)   (message "The region has 1 word."))
                          (t             (message "The region has %d words." count))))))



;; delete happiness (from http://www.ludd.luth.se/~wilper-8/computer/emacs.html)
(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word. With argument, do this that many times."
  (interactive "*p")
  (delete-region (point) (save-excursion (forward-word arg) (point))))
(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word. With argument, do this that many times."
  (interactive "*p")
  (delete-word (- arg)))


;; ;; find path of next Makefile upwards from current dir and setup the compile command (from http://www.emacswiki.org/emacs/CompileCommand)
;; (defun upward-find-file (filename &optional startdir)
;;   "Move up directories until we find a certain filename. If we
;;   manage to find it, return the containing directory. Else if we
;;   get to the toplevel directory and still can't find it, return
;;   nil. Start at startdir or . if startdir not given"

;;   (let ((dirname (expand-file-name
;;                   (if startdir startdir ".")))
;;         (found nil) ; found is set as a flag to leave loop if we find it
;;         (top nil))  ; top is set when we get
;;                                         ; to / so that we only check it once

;;                                         ; While we've neither been at the top last time nor have we found
;;                                         ; the file.
;;     (while (not (or found top))
;;                                         ; If we're at / set top flag.
;;       (if (string= (expand-file-name dirname) "/")
;;           (setq top t))

;;                                         ; Check for the file
;;       (if (file-exists-p (expand-file-name filename dirname))
;;           (setq found t)
;;                                         ; If not, move up a directory
;;         (setq dirname (expand-file-name ".." dirname))))
;;                                         ; return statement
;;     (if found dirname nil)))

;; ;; ;; Helper for compilation. Close the compilation window if
;; ;; ;; there was no error at all.
;; ;; ;; http://emacswiki.org/emacs/ModeCompile#toc2
;; ;; (defun compilation-exit-autoclose (status code msg)
;; ;;   ;; If M-x compile exists with a 0
;; ;;   (when (and (eq status 'exit) (zerop code))
;; ;;     ;; then bury the *compilation* buffer, so that C-x b doesn't go there
;; ;;     (bury-buffer)
;; ;;     ;; and delete the *compilation* window
;; ;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
;; ;;   ;; Always return the anticipated result of compilation-exit-message-function
;; ;;   (cons msg code))

(defun delete-word-xxx (arg)
  "Delete characters forward until encountering the end of a word. With argument, do this that many times."
  (interactive "*p")
  (delete-region (point) (save-excursion (forward-word arg) (point))))



                                        ; start auto-complete with emacs ----------------------------------------------
(require 'auto-complete)
                                        ; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
                                        ; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
;;                                         ; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;; ;; (defun my:ac-c-header-init ()
;; ;;   (require 'auto-complete-c-headers)
;; ;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;; ;;   (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
;; ;;   (add-to-list 'achead:include-directories '"/usr/arm-linux-gnueabi/include")
;; ;;   )
;;                                         ; now let's call this function from c/c++ hooks
;; ;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; ;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

                                        ; Fix iedit bug in Mac
(define-key global-map (kbd "C-;") 'iedit-mode)

;; ;; ;; FLYMAKE
;; ;; ; start flymake-google-cpplint-load
;; ;; ; let's define a function for flymake initialization
;; ;; (defun my:flymake-google-init ()
;; ;;   (require 'flymake-google-cpplint)
;; ;;   (custom-set-variables
;; ;;    '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;; ;;   (flymake-google-cpplint-load)
;; ;; )
;; ;; (add-hook 'c-mode-hook 'my:flymake-google-init)
;; ;; (add-hook 'c++-mode-hook 'my:flymake-google-init)

;; ;; ;; underline instead of highlight flymake
;; ;; (custom-set-faces
;; ;;  '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
;; ;;  '(flymake-warnline ((((class color)) (:underline "yellow")))))
;; ;; ;; END FLYMAKE

;; ;; ;; start google-c-style with emacs
;; ;; (require 'google-c-style)
;; ;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; ;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; ;; Compilation output
;; (setq compilation-scroll-output t)

;; ;; ;; FLYCHECK

;; ;; (use-package flycheck
;; ;;   :ensure t
;; ;;   :init (global-flycheck-mode))


;; ;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;; ;; ;; add include paths to flycheck

;; ;; (add-hook 'c++-mode-hook
;; ;;           (lambda () (setq flycheck-clang-include-path
;; ;;                            (list (expand-file-name "/usr/arm-linux-gnueabi/include")))))

;; ;; (add-hook 'c++-mode-hook
;; ;;           (lambda () (setq flycheck-clang-include-path
;; ;;                            (list (expand-file-name "/usr/arm-linux-gnueabi/include/c++/4.9.3")))))

;; ;; '(flycheck-perl-include-path
;; ;; (quote
;; ;; ("/usr/local/lib/perl/5.18.2/")))

;; ;; ;; END FLYCHECK






                                        ; turn on Semantic
(semantic-mode 1)
                                        ; let's define a function which adds semantic as a suggestion backend to auto complete
                                        ; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;;                                         ; turn on ede mode
;; ;; (global-ede-mode 1)
;; ;;                                         ; create a project for our program.
;; ;; (ede-cpp-root-project "my project" :file "~/work/temp/temp.cpp"
;; ;;                       :include-path '("~/work/temp/include_subdir"))
;; ;;                                         ; you can use system-include-path for setting up the system header file locations.
;; ;;                                         ; turn on automatic reparsing of open buffers in semantic
;; (global-semantic-idle-scheduler-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(background-color "#202020")
 '(background-mode dark)
 '(compilation-message-face (quote default))
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "ca36cbefb4e97c5be85b3a126739d33c7de337f82ba89633365a1da3453b2c46" "fad47d267d4e8664021a8adb02632942de0f4f75b0ddbcfa7368e637ed851b21" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" default)))
 '(fci-rule-color "#3C3D37")
 '(foreground-color "#cccccc")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/.org/work.org")))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

;; auto close bracket insertion. New in emacs 24
;; (electric-pair-mode 1)

(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;; autopair mode
(require 'autopair)
(autopair-global-mode 1)

;; TAGS

(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )
;; SMEX -- autocomplete for M-x

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; dired
(require 'dired+)

;; hippie expand M-/
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))


;; Change kind of comments in c++. TURN ON IF WE ARE WRITING C++

;; open .h files in c++ mode
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; (add-hook 'c++-mode-hook (lambda () (setq comment-start "//"

;;                                          comment-end   "")))
;; font size
(set-face-attribute 'default nil :height 120)

(global-linum-mode t)

(defun my-format-function()
  "Format buffer"
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace (point-min) (point-max))
  (indent-region (point-min) (point-max)))

(defun mrc-dired-do-command (command)
  "Run COMMAND on marked files. Any files not already open will be opened.
After this command has been run, any buffers it's modified will remain
open and unsaved."
  (interactive "CRun on marked files M-x ")
  (save-window-excursion
    (mapc (lambda (filename)
            (find-file filename)
            (call-interactively command))
          (dired-get-marked-files))))

(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;------------------------------------------------
;;;��{�I�Ȑݒ�
;;------------------------------------------------
;;���[�h�p�X�̐ݒ�
(add-to-list 'load-path "~/.emacs.d/lib/apel-10.8")
(add-to-list 'load-path "~/.emacs.d/lib/film-1.14.9")
(add-to-list 'load-path "~/.emacs.d/lib/semi-1.14.6")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/yatex")
(add-to-list 'load-path "~/.emacs.d/plugins/howm") 
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-w3m") 
(add-to-list 'load-path "~/.emacs.d/plugins/twittering-mode") 
(add-to-list 'load-path "~/.emacs.d/plugins/org/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/org/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/csharp-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/Mew")


;;�o�b�N�A�b�v�t�@�C�������Ȃ�
(setq backup-inhibited t) 

;; �N������ splash-screen ��\�����Ȃ��悤�ɂ���B
;; emacs --no-splash
;; M-x display-splash-screen �ŕ\���B
(setq inhibit-startup-message t) 

;;�����ۑ�
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;�G���[���Ƀo�b�N�g���[�X���J��
(setq debug-on-error nil)

;;�r�[�v��؂�
(setq ring-bell-function 'ignore)

;;info+
(eval-after-load "info" '(require 'info+))

;;browse-url �̐ݒ�
(global-set-key [S-mouse-2] 'browse-url-at-mouse)


;;�^�C���X�^���v
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last updated : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")

(setq default-input-method "W32-IME")
(setq-default w32-ime-mode-line-state-indicator "[--]") ;; �����݂̂�
(setq w32-ime-mode-line-state-indicator-list '("[--]" "[��]" "[--]")) ;; �����݂̂�
(w32-ime-initialize) 
;;;-----------------------------------------------
;;;auto-install.el�ɂ��EmacsLisp�̊Ǘ�
;;;-----------------------------------------------
;;auto-install�ɂ���ăC���X�g�[�������Emacs Lisp�����[�h�p�X�Ɋ܂߂�
;;auto-install�����[�h
(add-to-list 'load-path "~/.emacs.d/auto-install/") 
(require 'auto-install)                             
(setq auto-install-directory "~/.emacs.d/auto-install/")

;;�N������EmacsWiki�̃y�[�W����⊮���Ɋ܂߂�
(auto-install-update-emacswiki-package-name t)

;;install-elisp�ƌ݊��ɂ���
(auto-install-compatibility-setup)

;;ediff�֘A�̃o�b�t�@����ɂ܂Ƃ߂�
(setq ediff-window-setup-function 
      'ediff-setup-windows-plain)

;;---------------------------------------------
;;ELPA
;;------------------------------------------------
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;;------------------------------------------------
;;;������
;;;------------------------------------------------
;;�s�ԍ��̕\��
(require 'linum)          ;linum-mode�����[�h
(global-linum-mode t)    
(setq linum-format "%5d")
 
;; ;; �s�Ԏw��
(set-default 'line-spacing 2)

;; ;;�t�H���g���b�N���[�h��L���ɂ�
(global-font-lock-mode t)

;; ;;�J�����g�s���n�C���C�g����
 (global-hl-line-mode t)

;; ;;���[�h�s�ɏ���ǉ�����
(display-time-mode t)
 (line-number-mode t)
;; ;;�E�C���h�E�̏����l
(setq default-frame-alist
      (append (list
	       '(width . 80)
	       '(height . 40)
	       '(top . 10)
	       '(left . 10)
		)
	       
	       default-frame-alist))
      ;; ;;�J���[�ݒ�
(if window-system (progn
		    ;; ;; ;; �����̐F��ݒ肵�܂��B
		    ;; (add-to-list 'default-frame-alist '(foreground-color . "dark gray"))
		    ;; ;; ;; �w�i�F��ݒ肵�܂��B
		    ;; (add-to-list 'default-frame-alist '(background-color . "black"))
		    
		    ;; ;; ;; �J�[�\���̐F��ݒ肵�܂��B
		    ;; (add-to-list 'default-frame-alist '(cursor-color . "cyan"))
		    ;; ;; ;; �}�E�X�|�C���^�̐F��ݒ肵�܂��B
		    ;; (add-to-list 'default-frame-alist '(mouse-color . "cyan"))
		    ;; ;; ;; ���[�h���C���̕����̐F��ݒ肵�܂��B
		    ;; (set-face-foreground 'modeline "black")
		    ;; ;; ;; ���[�h���C���̔w�i�F��ݒ肵�܂��B
		    ;; (set-face-background 'modeline "lightgray")
		    ;; ;; ;; �I�𒆂̃��[�W�����̐F��ݒ肵�܂��B
		    ;; (set-face-background 'region "darkcyan")
		    ;; ;; ;; ���[�h���C���i�A�N�e�B�u�łȂ��o�b�t�@�j�̕����F��ݒ肵�܂��B
		    ;; (set-face-foreground 'mode-line-inactive "gray30")
		    ;; ;; ;; ���[�h���C���i�A�N�e�B�u�łȂ��o�b�t�@�j�̔w�i�F��ݒ肵�܂��B
		    ;; (set-face-background 'mode-line-inactive "gray85")
		    ;; ;;��ʂ𓧉�
		    ;; (add-to-list 'default-frame-alist '(alpha . (80 40)))))

		    ;; �����̐F��ݒ肵�܂�
		    (add-to-list 'default-frame-alist '(foreground-color . "gray10"))
		    ;; ;; �w�i�F��ݒ肵�܂��B
		    (add-to-list 'default-frame-alist '(background-color . "white"))
		    ;; ;; �J�[�\���̐F��ݒ肵�܂��B
		    (add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
		    ;; ;;  �}�E�X�|�C���^�̐F��ݒ肵�܂��B
		    (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
		    ;; ;; ���[�h���C���̕����̐F���B
		    (set-face-foreground 'modeline "white")
		    ;; ;; ���[�h���C���̔w�i�F��ݒ肵�܂��B
		    (set-face-background 'modeline "MediumPurple2")
		    ;; ;; �I�𒆂̃��[�W�����̐F��ݒ肵�܂��B
		    (set-face-background 'region "LightSteelBlue1")
		    ;; ;; ���[�h���C���i�A�N�e�B�u�łȂ��o�b�t�@�j�̕����F��ݒ肵�܂��B
		    (set-face-foreground 'mode-line-inactive "gray30")
		    ;; ;; ���[�h���C���i�A�N�e�B�u�łȂ��o�b�t�@�j�̔w�i�F��ݒ肵�܂��B
		    (set-face-background 'mode-line-inactive "gray85")
		    ;; ;;��ʂ𓧉�
		    ;; ;(add-to-list 'default-frame-alist '(alpha . (90 70)))
		     ))
		    
;; ;;;------------------------------------------------
;; ;;;�t�H���g
;; ;;;------------------------------------------------
(set-default-font "Inconsolata-14")
(set-face-font 'variable-pitch "Inconsolata-14")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("Takao�S�V�b�N" . "unicode-bmp"))

;; ;;;------------------------------------------------
;; ;;;����ݒ�
;; ;;;------------------------------------------------
;; ;;���P�[���̐ݒ�
(set-language-environment "Japanese")
(global-set-key "\C-o" 'toggle-input-method)


;; ;;;------------------------------------------------
;; ;;;���j���[
;; ;;;------------------------------------------------
;; ;;�ŋߎg�����t�@�C����\��
(require 'recentf)
(recentf-mode t)

;; ;;�t���[�������o�b�t�@���ɂ���
(setq frame-title-format "%b")

;; ;;;------------------------------------------------
;; ;;;�o�b�t�@�ƃt�@�C��
;; ;;;------------------------------------------------
;; ;;sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)

;; ;;ffap���݈ʒu�̃t�@�C���E�t�q�k���J��
(ffap-bindings)

;; ;;�t�@�C��������������Ƀo�b�t�@�����킩��₷������
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ;;�o�b�t�@�ؑւ�����
(iswitchb-mode t)

;; ;;�o�b�t�@�ǂݎ��֐���iswitchb�ɂ���
(setq read-buffer-function 'iswitchb-read-buffer)
;; ;;���K�\�����g��Ȃ�
(setq iswitchb-regexp nil)
;; ;;�V�����o�b�t�@�����邩�ǂ����𕷂��Ȃ�
(setq iswitchb-prompt-newbuffer nil)

;; ;;�t�@�C���̓���ʒu���u�b�N�}�[�N����
;; ;;�u�b�N�}�[�N��ύX�����瑦�ۑ�
(setq bookmark-save-flag t)
;; ;;�������@
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; ;;�g��Ȃ��o�b�t�@������(�s�v)
;; ;(require 'tempbuf)
;; ;;�t�@�C�����J�����玩���I��tempbuf��L���ɂ���
;; ;(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; ;;dired�ɂ������Ă��Atempbuf��L���ɂ���
;; ;(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; ;;�t�@�C���̎����ۑ�
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers)

;; ;;Emacs����摜���J�� open-image
(auto-image-file-mode t)
(setq thumbs-thumbsdir
       (expand-file-name "~/.emacs-thumbs"))
(setq thumbs-temp-dir (expand-file-name "~/tmp"))



;; ;;;------------------------------------------------
;; ;;;Dired
;; ;;;------------------------------------------------
;; ;;bf-mode
(require 'dired)
(require 'bf-mode)
(setq bf-mode-except-ext '("\\.exe$" "\\.com$"))
(setq bf-mode-html-with-w3m t) ; html �� w3m �ŕ\������
(setq bf-mode-archive-list-verbose t) ; ���k���ꂽ�t�@�C����\��
(setq bf-mode-directory-list-verbose t); �f�B���N�g�����̃t�@�C���ꗗ��\��

;; ;;wdired
(require 'wdired)

;; ;;;------------------------------------------------
;; ;;;revive.el���g���đO��N�����̏�Ԃ������\
;; ;;;------------------------------------------------
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)

;; ;;;------------------------------------------------
;; ;;;elscreeen���g����tab���Ǘ�����
;; ;;;------------------------------------------------
(require 'elscreen)
(require 'elscreen-dnd)
(require 'elscreen-howm)
(require 'elscreen-w3m)

(defun elscreen-frame-title-update ()
  (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
    (let* ((screen-list (sort (elscreen-get-screen-list) '<))
(screen-to-name-alist (elscreen-get-screen-to-name-alist))
(title (mapconcat
(lambda (screen)
(format "%d%s %s"
screen (elscreen-status-label screen)
(get-alist screen screen-to-name-alist)))
screen-list " ")))
      (if (fboundp 'set-frame-name)
(set-frame-name title)
(setq frame-title-format title)))))

(eval-after-load "elscreen"
  '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))


;; ;;;------------------------------------------------
;; ;;;���͎x��
;; ;;;------------------------------------------------
(require 'anything-startup)

;; ;; ;;yasnippet
(require 'yasnippet)
(require 'yasnippet-config)
(require 'anything-c-yasnippet)
(yas/setup "~/.emacs.d/plugins")

;; ���j���[�͎g��
(setq yas/use-menu t)

;; ;;autoinsert�ɂ��e���v���[�g�}��
;; ;; ;;ref �Ђ��ۂ�
(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/template/")
(setq auto-insert-alist
      (nconc '(
	       ("\\.cs"    . ["template.cs"     my-template])
	       ("\\.cpp"   . ["template.cpp"   my-template])
	       ("\\.c"     . ["template.c"     my-template])
	       ("\\.h$"    . ["template.h"     my-template])
	       ("\\.java"  . ["template.java"  my-template])
	       ("\\.pl"    . ["template.pl"    my-template])
	       ("\\.rb"    . ["template.rb"    my-template])
		) auto-insert-alist))
(require 'cl)

(defvar template-replacements-alists
  '(("%file%" . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ("%include-guard%" . (lambda () (format "NYX_INCLUDED_%s_H_" (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))))))

(defun my-template ()
  (time-stamp)
   (mapc #'(lambda(c)
	     (progn
	       (goto-char (point-min))
	       (replace-string (car c) (funcall (cdr c)) nil)))
	 template-replacements-alists)
   (goto-char (point-max))
   (message "done."))
 (add-hook 'find-file-not-found-hooks 'auto-insert)

;; ;;;------------------------------------------------
;; ;;;auto-complete�ɂ�鎩���⊮
;; ;;;------------------------------------------------
(require 'auto-complete-config)
(require 'auto-complete-yasnippet)
;;�f�t�H���g�ݒ���g��
(ac-config-default)
;;�����̏ꏊ��������
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;���auto-complete��L���ɂ���
(global-auto-complete-mode t);
;;�����ŕ⊮�J�n
(setq ac-auto-start t)
;;�g���K�[�L�[�̓^�u
;(ac-set-trigger-key "TAB")
;;�\�[�X
(setq ac-sources '(
		   ac-source-abbrev 
		   ac-source-dictionary 
		   ac-source-words-in-buffer
		   ac-source-words-in-same-mode-buffers
		   ac-source-yasnippet))

;; ;(require 'auto-complete-clang)
;; (defun my-ac-cc-mode-setup ()
;;   ;;t�Ȃ玩���ŕ⊮��ʂ��ł�Dnil�Ȃ�⊮�L�[�ɂ���ďo��
;;  ; (setq ac-auto-start 3)
;;   (setq ac-clang-prefix-header "~/.emacs.d/ac-dict/stdafx.pch")
;;   (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
;;   (setq ac-sources '(
;; 		     ac-source-clang
;; 		     ac-source-yasnippet  
;; 		     ac-source-gtags)))


;; (defun my-ac-config ()
;;   (global-set-key "\M-/" 'ac-start)
;;   ;; C-n/C-p �Ō���I��
;;   (define-key ac-complete-mode-map "\C-n" 'ac-next)
;;   (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  
;;   (setq-default ac-sources '(ac-source-abbrev 
;;    			     ac-source-dictionary 
;;    			     ac-source-yasnippet
;;    			     ac-source-words-in-same-mode-buffers))
;;   (add-hook 'c++-mode-hook 'my-ac-cc-mode-setup)
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))

;; (my-ac-config)


;; ;;;------------------------------------------------
;; ;;;�����ƃX�y��
;; ;;;------------------------------------------------
;; http://www4.kcn.ne.jp/~boochang/emacs/ispell.html 
;; ;;�����t�@�C��
;; ;; �R�}���h�̐ݒ�
;; (setq ispell-program-name "aspell")	; ispell �̑���� aspell ���g��
;; (setq ispell-grep-command "grep")	; �f�t�H���g�� egrep �� Cygwin �ł̓V���{���b�N�����N
;; 					; �Ȃ̂ŁAMeadow ����N���ł��Ȃ�
;; ;; ���{��t�@�C�����̉p�P��X�y���`�F�b�N���\�ɂ���
;; (eval-after-load "ispell"
;;   '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]")))

;; ;;;-----------------------------------------------
;; ;;;�v���O���~���O�x��
;; ;;;-----------------------------------------------
;; ;; flymake
(require 'flymake)
(defun flymake-cc-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "g++-4" (list "-Wall" "-Wextra" "-Wconversion" "-fsyntax-only" local-file))))
(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)


;;smart-compile
;; ref. http://homepage.mac.com/zenitani/elisp-j.html#smart-compile
(require 'smart-compile+)
(define-key menu-bar-tools-menu [compile] '("Compile..." . smart-compile))
(when (require 'smart-compile+ "smart-compile" t)
  (global-set-key "\C-cc" 'smart-compile)
  (add-hook 'cc-mode-common-hook
            (lambda ()(local-set-key "\C-cc" 'smart-compile)))
  (add-hook 'sh-mode-hook
            (lambda ()(local-set-key "\C-cc" 'smart-compile))))

;;;configure cc-mode-common
 (add-hook 'cc-mode-common-hook
	   '(lambda ()
	      (flymake-mode t)
	    ))

;;cperl-mode
;; ;;ref. http://www.bookshelf.jp/soft/meadow_41.html#SEC619
(autoload 'cperl-mode "cperl-mode" 
  "alternate mode for editing Perl programs" t)
(setq auto-mode-alist
      (append '(("\\.\\([pP][Llm]\\|al\\)$" . cperl-mode))  auto-mode-alist ))
(setq interpreter-mode-alist (append interpreter-mode-alist

                                     '(("perl" . cperl-mode))))

;;ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
	     (inf-ruby-keys)))

;;python-mode
(autoload 'python-mode "python-mode" "Python editing mode" t)
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
	    interpreter-mode-alist))

;;lua-mode
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)

;;GNU GLOBAL(gtags)
(require 'gtags)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)))
	
;auto create TAGS file
(defadvice find-tag (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "etags *.[ch] *.el .*.el -o TAGS 2>/dev/null"))
    (visit-tags-table tag-file)))

;;scheme-mode
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(defun run-guile () (interactive) (run-scheme "guile"))
;(defun run-gauche () (interactive) (run-scheme "/opt/local/bin/gosh"))

;;javascript-mode
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;;html-helper-mode
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist 
      (append '(("\\.html$" . html-helper-mode)
 		("\\.shtml$" . html-helper-mode)
 		("\\.html$" . html-helper-mode)
 		("\\.shtml$" . html-helper-mode)
 		) auto-mode-alist))

;;css-mode
(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))

;;gdb-mode
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t) ; "IO buffer" ���K�v�Ȃ��ꍇ��  nil ��

;;gist
(require 'gist)

;;csharp
;; C# mode
(require 'csharp-mode)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
;;;-----------------------------------------------
;;;Emacs shell�̐ݒ�
;;;-----------------------------------------------

;; (add-hook 'set-language-environment-hook 
;;           (lambda ()
;;             (when (equal "ja_JP.UTF-8" (getenv "LANG"))
;;               (setq default-process-coding-system '(utf-8 . utf-8))
;;               (setq default-file-name-coding-system 'utf-8))
;;             (when (equal "Japanese" current-language-environment)
;;               (setq default-buffer-file-coding-system 'iso-2022-jp))))

(set-language-environment "Japanese")

;;buffer-clear
;ref.http://www.bookshelf.jp/pukiwiki/pukiwiki.php?Eshell%A4%F2%BB%C8%A4%A4%A4%B3%A4%CA%A4%B9#content_1_42
(defun my-eshell-hook ()
  (local-set-key "\C-a" 'eshell-bol))
(add-hook 'eshell-mode-hook 'my-eshell-hook)

;;�Ղ���
 (setq eshell-prompt-function
       (lambda nil
	 (concat
	  "t.hayamizu@eshell "
	  (format-time-string "%H:%M" (current-time))
	  (if (= (user-uid) 0) " # " " $ "))))

;;shell/clear
(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;;------------------------------------------------
;;;�����ƒu��
;;;------------------------------------------------
;;migemo
;;; ���[�}���̂܂ܓ��{����C���N�������^���T�[�`����
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
;; migemo-dict�̃p�X���w��
(setq migemo-dictionary "~/.emacs.d/dict/utf-8.d/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
;; �L���b�V���@�\�𗘗p����
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
;; �����̕����R�[�h���w��D
(setq migemo-coding-system 'utf-8)

(load-library "migemo")
;; �N�����ɏ��������s��
(migemo-init)
;; ��{�ݒ�
;;color-moccur
(require 'color-moccur)

;;moccur-edit
(require 'moccur-edit)
(setq moccur-split-word t);���؁[���ŋ�؂�ꂽ�����̒P����܂���

;;igrep.el
(require 'igrep)
;;lgrep��-0u8�I�v�V�����������UTF8
(igrep-define lgrep (igrep-use-zgrep nil) (igrep-regexp-option "-n -0u8"))
(igrep-find-define lgrep (igrep-use-zgrep nil) (igrep-regexp-option "-n -0u8"))

;;grep-a-lot
(require 'grep-a-lot)
(grep-a-lot-setup-keys)

;;igrep�p
(grep-a-lot-advise igrep)

;;grep-edit
(require 'grep-edit)

;;;-----------------------------------------------
;;;�L�[�o�C���f�B���O
;;;-----------------------------------------------


;;;-----------------------------------------------
;;;org-mode�ɂ�镶������
;;;-----------------------------------------------
;;��{�ݒ�
(require 'org)

;;�������Ƃ�
;; org-remember���g��
(org-remember-insinuate)
;; org-remember�̃e���v���[�g
(setq org-remember-templates
      '(("Note" ?n "* %?\n  %i\n  %a" nil "Tasks")
	("Todo" ?t "* TODO %?\n  %i\n  %a" nil "Tasks")))
;;Todo
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; DONE�̎������L�^
(setq org-log-done 'time)

;;tex+pdf
(setq org-export-latex-coding-system 'utf-8)
(setq org-export-latex-date-format "%Y-%m-%d")
(setq org-export-latex-classes nil)
(add-to-list 'org-export-latex-classes
  '("jarticle"
    "\\documentclass[a4j]{jarticle}"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))
;;-----------------------------------------------
;; Windows �ŗL�̐ݒ�
;;-----------------------------------------------
;;cygwin-mount
;(when (eq system-type 'windows-nt)
;  (require 'cygwin-mount)
;  (cygwin-mount-activate))

;;-----------------------------------------------
;; HOWM�@�E�B�L���ė����ȁI
;;-----------------------------------------------
;;���[�h
(require 'howm)
;;���j���[�̌���͓��{��
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f)
   (autoload f
     "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))

;; �����X�V���Ȃ� 
(setq howm-menu-refresh-after-save nil)

;; ���t���b�V�����Ȃ�
(setq howm-refresh-after-save nil)


;;-----------------------------------------------
;; mew���g���ă��[��
;;-----------------------------------------------
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;-----------------------------------------------
;; W3M���g���� �u���E�W���O
;;-----------------------------------------------
;; ;; ;;;w3m
 ;;set w3m
(when (eq system-type 'windows-nt)
  (setq w3m-command "d:/cygwin/bin/w3m"))
(when (eq system-type 'darwin)
  (setq w3m-command "/usr/local/bin/w3m"))

(autoload 'w3m "w3m"
  "Interface for w3m on Emacs." t)
(autoload 'w3m-find-file "w3m"
  "Find a local file using emacs-w3m." t)
(autoload 'w3m-search "w3m-search"
  "Search words using emacs-w3m." t)
(autoload 'w3m-weather "w3m-weather"
  "Display a weather report." t)
(autoload 'w3m-antenna "w3m-antenna"
  "Report changes of web sites." t)
(autoload 'w3m-namazu "w3m-namazu"
  "Search files with Namazu." t)

;use cookie
(setq w3m-use-cookies t)

;home page is google
(setq w3m-home-page "http://www.google.co.jp")
 	
(setq w3m-fill-column -10)

;display inline image
(setq w3m-default-display-inline-images t)

;appliaction binding for w3m
(setq w3m-content-type-alist
      '(("text/plain" "\\.\\(txt\\|tex\\|diary\\|el\\)" nil)
        ("text/html" "\\.s?html?$" w3m-w32-browser-with-fiber)
        ("text/html" "[0-9]+$" w3m-w32-browser-with-fiber)
        ("image/jpeg" "\\.jpe?g$" ("fiber.exe" file))
        ("image/png" "\\.png$" ("fiber.exe" file))
        ("image/gif" "\\gif$" ("fiber.exe" file))
        ("image/tiff" "\\tif?f$" ("fiber.exe" file))
        ("image/x-xwd" "\\.xwd$" ("fiber.exe" file))
        ("image/x-xbm" "\\.xbm$" ("fiber.exe" file))
        ("image/x-xpm" "\\.xpm$" ("fiber.exe" file))
        ("image/x-bmp" "\\.bmp$" ("fiber.exe" file))
        ("video/mpeg" "\\.mpe?g$" ("fiber.exe" file))
        ("video/quicktime" "\\.mov$" ("fiber.exe" file))
        ("application/postscript"
         "\\.\\(ps\\|eps\\)$" ("fiber.exe" file))
        ("application/pdf" "\\.pdf$" ("fiber.exe" file))))

;; -----------------------------------------------
;; �͂Ă�
;; -----------------------------------------------
;(add-to-list 'load-path "~/.emacs.d/plugins/simple-hatena-mode/")
;(require 'simple-hatena-mode)
;(setq simple-hatena-default-id "Crest")
;(setq simple-hatean-bin "/usr/bin/hw.pl")
;; ;;hatena-mode��hatenahelper-mode�p
;; (autoload 'hatena "hatena-mode" "hatena mode" t)
;; (setq hatena-usrid "Crest")
;; (setq hatena-plugin-directory "~/site-lisp/")
;; (require 'hatenahelper-mode)
;; (add-hook 'hatena-mode-hook
;; 	  '(lambda ()
;; 	     (hatenahelper-mode 1)))

;(require 'hatena-diary-mode)
;(setq hatena-usrid "your username on Hatena::Diary")
;(setq hatena-plugin-directory "~/.emacs.d/plugins")
;;    `hatena-use-file' �� non-nil �ɂ���ƃp�X���[�h�� base64 ��
;;    �Í������ăt�@�C���ɕۑ����܂����A"�l�Ԃ����Ă����킩��Ȃ�"���炢��
;;    �Ӗ������Ȃ��̂Œ��ӂ��ĉ������B
;;
;; (require 'yahtml)
;; (defvar hatena-dir "~/.hatena")
;; (defun hatena ()
;;   "Open today's hatena diary file."
;;   (interactive)
;;   (find-file
;;    (concatenate 'string hatena-dir "/"
;;                 (format-time-string "%Y-%m-%d.txt" (current-time)))))


;; (defun myhatena-submit ()
;;   "Submit hatena diary file."
;;     (interactive)
;;     (basic-save-buffer)
;;     (compile 
;;      (concatenate `string "hw.pl -f " (buffer-name))))

;; (define-derived-mode myhatena-mode yahtml-mode "hatena"
;;   "Simple hatena diary mode.")
;; (global-set-key "\C-c\C-p" 'myhatena-submit)
;; (add-to-list 'auto-mode-alist '("~/.hatena/.+txt$" . myhatena-mode))

;;-----------------------------------------------
;; Twittering-mode
;;-----------------------------------------------
;;twittering-mode
(require 'twittering-mode)
;;���[�U��
(setq twittering-username "thayamizu")
;;�X�V�Ԋu120sec
(setq twittering-timer-interval 120)
;;�A�C�R���\��
(setq twittering-icon-mode t)
;;�X�N���[������
(setq twittering-scroll-mode t)

;;�O��N�����̏�Ԃ𕜌�����
;(resume)


;;�T�[�o�[�N��
(server-start) 


;; ;;;-----------------------------------------------
;; ;;;POWERLINE
;; ;;;-----------------------------------------------
(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\". c %s\",
\"  c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \"};"  color1 color2))

(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\". c %s\",
\"  c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\"};"  color2 color1))


(defconst color1 "#FF6699")
(defconst color3 "#CDC0B0")
(defconst color2 "#FF0066")
(defconst color4 "#CDC0B0")

(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 "None") 'xpm t :ascent 'center))
(defvar arrow-left-1  (create-image (arrow-left-xpm color2 color1) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))

(setq-default mode-line-format
 (list  '(:eval (concat (propertize " %b " 'face 'mode-line-color-1)
                        (propertize " " 'display arrow-right-1)))
        '(:eval (concat (propertize " %m " 'face 'mode-line-color-2)
                        (propertize " " 'display arrow-right-2)))

        ;; Justify right by filling with spaces to right fringe - 16
        ;; (16 should be computed rahter than hardcoded)
        '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))

        '(:eval (concat (propertize " " 'display arrow-left-2)
                        (propertize " %p " 'face 'mode-line-color-2)))
        '(:eval (concat (propertize " " 'display arrow-left-1)
                        (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
)) 

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                    :background color1)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground "#fff"
                    :background color2)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background color3
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#ffff"
                    :background color4)


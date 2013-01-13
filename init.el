;;;------------------------------------------------
;;;基本的な設定
;;------------------------------------------------
;;ロードパスの設定
(add-to-list 'load-path "~/.emacs.d/lib/apel-10.8")
(add-to-list 'load-path "~/.emacs.d/lib/flim-1.14.9")
(add-to-list 'load-path "~/.emacs.d/lib/semi-1.14.6")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/yatex")
(add-to-list 'load-path "~/.emacs.d/plugins/howm") 
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-w3m") 
(add-to-list 'load-path "~/.emacs.d/plugins/twittering-mode") 
(add-to-list 'load-path "~/.emacs.d/plugins/org/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/simple-hatena-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/org/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/csharp-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/Mew")

;;
(setenv "PATH" (concat (expand-file-name "~/.emacs.d/bin") (getenv "PATH")))

;;バックアップファイルを作らない
(setq backup-inhibited t) 

(setq system-time-locale "C")

;; 起動時に splash-screen を表示しないようにする。
;; emacs --no-splash
;; M-x display-splash-screen で表示。
(setq inhibit-startup-message t) 

;;自動保存
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;エラー時にバックトレースを開く
(setq debug-on-error nil)

;;ビープを切る
(setq ring-bell-function 'ignore)

;;info+
(eval-after-load "info" '(require 'info+))

;;browse-url の設定
(global-set-key [S-mouse-2] 'browse-url-at-mouse)


;;タイムスタンプ
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "last updated : ")
(setq time-stamp-format "%04y/%02m/%02d")
(setq time-stamp-end " \\|$")
;;;-----------------------------------------------
;;;auto-install.elによるEmacsLispの管理
;;;-----------------------------------------------
;;auto-installによってインストールされるEmacs Lispをロードパスに含める
;;auto-installをロード
(add-to-list 'load-path "~/.emacs.d/auto-install/") 
(require 'auto-install)                             
(setq auto-install-directory "~/.emacs.d/auto-install/")

;;起動時にEmacsWikiのページ名を補完候補に含める
(auto-install-update-emacswiki-package-name t)

;;install-elispと互換にする
(auto-install-compatibility-setup)

;;ediff関連のバッファを一つにまとめる
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

;;;----------------------------------------------
;;;標準IMEの設定
;;;-----------------------------------------------
(when (eq system-type 'windows-nt)
  (setq default-input-method "W32-IME")
  (w32-ime-initialize)
  (setq-default w32-ime-mode-line-state-indicator "[--]")
  (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
  (setq w32-ime-buffer-switch-p nil))

;;;------------------------------------------------
;;;見た目
;;;------------------------------------------------
;;行番号の表示
(require 'linum)          ;linum-modeをロード
(global-linum-mode t)    
(setq linum-format "%5d")
 
;; ;; 行間指定
(set-default 'line-spacing 2)

;; ;;フォントロックモードを有効にす
(global-font-lock-mode t)

;; ;;カレント行をハイライトする
 (global-hl-line-mode t)

;; ;;モード行に情報を追加する
(display-time-mode t)
 (line-number-mode t)
;; ;;ウインドウの初期値
(setq default-frame-alist
      (append (list
	       '(width . 80)
	       '(height . 40)
	       '(top . 10)
	       '(left . 10)
		)
	       
	       default-frame-alist))
      ;; ;;カラー設定
(if window-system (progn
		    ;; ;; ;; 文字の色を設定します。
		    ;; (add-to-list 'default-frame-alist '(foreground-color . "dark gray"))
		    ;; ;; ;; 背景色を設定します。
		    ;; (add-to-list 'default-frame-alist '(background-color . "black"))
		    
		    ;; ;; ;; カーソルの色を設定します。
		    ;; (add-to-list 'default-frame-alist '(cursor-color . "cyan"))
		    ;; ;; ;; マウスポインタの色を設定します。
		    ;; (add-to-list 'default-frame-alist '(mouse-color . "cyan"))
		    ;; ;; ;; モードラインの文字の色を設定します。
		    ;; (set-face-foreground 'modeline "black")
		    ;; ;; ;; モードラインの背景色を設定します。
		    ;; (set-face-background 'modeline "lightgray")
		    ;; ;; ;; 選択中のリージョンの色を設定します。
		    ;; (set-face-background 'region "darkcyan")
		    ;; ;; ;; モードライン（アクティブでないバッファ）の文字色を設定します。
		    ;; (set-face-foreground 'mode-line-inactive "gray30")
		    ;; ;; ;; モードライン（アクティブでないバッファ）の背景色を設定します。
		    ;; (set-face-background 'mode-line-inactive "gray85")
		    ;; ;;画面を透過
		    ;; (add-to-list 'default-frame-alist '(alpha . (80 40)))))

		    ;; 文字の色を設定します
		    (add-to-list 'default-frame-alist '(foreground-color . "gray10"))
		    ;; ;; 背景色を設定します。
		    (add-to-list 'default-frame-alist '(background-color . "white"))
		    ;; ;; カーソルの色を設定します。
		    (add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
		    ;; ;;  マウスポインタの色を設定します。
		    (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
		    ;; ;; モードラインの文字の色を。
		    (set-face-foreground 'modeline "white")
		    ;; ;; モードラインの背景色を設定します。
		    (set-face-background 'modeline "MediumPurple2")
		    ;; ;; 選択中のリージョンの色を設定します。
		    (set-face-background 'region "LightSteelBlue1")
		    ;; ;; モードライン（アクティブでないバッファ）の文字色を設定します。
		    (set-face-foreground 'mode-line-inactive "gray30")
		    ;; ;; モードライン（アクティブでないバッファ）の背景色を設定します。
		    (set-face-background 'mode-line-inactive "gray85")
		    ;; ;;画面を透過
		    ;; ;(add-to-list 'default-frame-alist '(alpha . (90 70)))
		     ))
		    
;; ;;;------------------------------------------------
;; ;;;フォント
;; ;;;------------------------------------------------
(set-default-font "Inconsolata-14")
(set-face-font 'variable-pitch "Inconsolata-14")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("Takaoゴシック" . "unicode-bmp"))

;; ;;;------------------------------------------------
;; ;;;言語設定
;; ;;;------------------------------------------------
;; ;;ロケールの設定
(set-language-environment "Japanese")
(global-set-key "\C-o" 'toggle-input-method)


;; ;;;------------------------------------------------
;; ;;;メニュー
;; ;;;------------------------------------------------
;; ;;最近使ったファイルを表示
(require 'recentf)
(recentf-mode t)

;; ;;フレーム名をバッファ名にする
(setq frame-title-format "%b")

;; ;;;------------------------------------------------
;; ;;;バッファとファイル
;; ;;;------------------------------------------------
;; ;;sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)

;; ;;ffap現在位置のファイル・ＵＲＬを開く
(ffap-bindings)

;; ;;ファイル名が被った時にバッファ名をわかりやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ;;バッファ切替を強化
(iswitchb-mode t)

;; ;;バッファ読み取り関数をiswitchbにする
(setq read-buffer-function 'iswitchb-read-buffer)
;; ;;正規表現を使わない
(setq iswitchb-regexp nil)
;; ;;新しいバッファをつくるかどうかを聞かない
(setq iswitchb-prompt-newbuffer nil)

;; ;;ファイルの特定位置をブックマークする
;; ;;ブックマークを変更したら即保存
(setq bookmark-save-flag t)
;; ;;超整理法
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; ;;使わないバッファを消す(不要)
;; ;(require 'tempbuf)
;; ;;ファイルを開いたら自動的にtempbufを有効にする
;; ;(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; ;;diredにたいしても、tempbufを有効にする
;; ;(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; ;;ファイルの自動保存
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers)

;; ;;Emacsから画像を開く open-image
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
(setq bf-mode-html-with-w3m t) ; html は w3m で表示する
(setq bf-mode-archive-list-verbose t) ; 圧縮されたファイルを表示
(setq bf-mode-directory-list-verbose t); ディレクトリ内のファイル一覧を表示

;; ;;wdired
(require 'wdired)

;; ;;;------------------------------------------------
;; ;;;revive.elを使って前回起動時の状態も復元可能
;; ;;;------------------------------------------------
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)

;; ;;;------------------------------------------------
;; ;;;elscreeenを使ってtabを管理する
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
;; ;;;入力支援
;; ;;;------------------------------------------------
(require 'anything-startup)

;; ;; ;;yasnippet
(require 'yasnippet)
(require 'yasnippet-config)
(require 'anything-c-yasnippet)
(yas/setup "~/.emacs.d/plugins")

;; メニューは使う
(setq yas/use-menu t)

;; ;;autoinsertによるテンプレート挿入
;; ;; ;;ref ひげぽん
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
;; ;;;auto-completeによる自動補完
;; ;;;------------------------------------------------
(require 'auto-complete-config)
(require 'auto-complete-yasnippet)
;;デフォルト設定を使う
(ac-config-default)
;;辞書の場所を教える
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;常にauto-completeを有効にする
(global-auto-complete-mode t);
;;自動で補完開始
(setq ac-auto-start t)
;;トリガーキーはタブ
;(ac-set-trigger-key "TAB")
;;ソース
(setq ac-sources '(
		   ac-source-abbrev 
		   ac-source-dictionary 
		   ac-source-words-in-buffer
		   ac-source-words-in-same-mode-buffers
		   ac-source-yasnippet))

;; ;(require 'auto-complete-clang)
;; (defun my-ac-cc-mode-setup ()
;;   ;;tなら自動で補完画面がでる．nilなら補完キーによって出る
;;  ; (setq ac-auto-start 3)
;;   (setq ac-clang-prefix-header "~/.emacs.d/ac-dict/stdafx.pch")
;;   (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
;;   (setq ac-sources '(
;; 		     ac-source-clang
;; 		     ac-source-yasnippet  
;; 		     ac-source-gtags)))


;; (defun my-ac-config ()
;;   (global-set-key "\M-/" 'ac-start)
;;   ;; C-n/C-p で候補を選択
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
;; ;;;辞書とスペル
;; ;;;------------------------------------------------
;; http://www4.kcn.ne.jp/~boochang/emacs/ispell.html 
;; ;;辞書ファイル
;; ;; コマンドの設定
;; (setq ispell-program-name "aspell")	; ispell の代わりに aspell を使う
;; (setq ispell-grep-command "grep")	; デフォルトの egrep が Cygwin ではシンボリックリンク
;; 					; なので、Meadow から起動できない
;; ;; 日本語ファイル中の英単語スペルチェックを可能にする
;; (eval-after-load "ispell"
;;   '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]")))

;; ;;;-----------------------------------------------
;; ;;;プログラミング支援
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
(setq gdb-use-separate-io-buffer t) ; "IO buffer" が必要ない場合は  nil で

;;gist
(require 'gist)

;;csharp
;; C# mode
(require 'csharp-mode)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
;;;-----------------------------------------------
;;;Emacs shellの設定
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

;;ぷろんぷ
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
;;;検索と置換
;;;------------------------------------------------
;;migemo
;;; ローマ字のまま日本語をインクリメンタルサーチする
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
;; migemo-dictのパスを指定
(setq migemo-dictionary "~/.emacs.d/dict/utf-8.d/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
;; キャッシュ機能を利用する
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
;; 辞書の文字コードを指定．
(setq migemo-coding-system 'utf-8)

(load-library "migemo")
;; 起動時に初期化も行う
(migemo-init)
;; 基本設定
;;color-moccur
(require 'color-moccur)

;;moccur-edit
(require 'moccur-edit)
(setq moccur-split-word t);すぺーすで区切られた複数の単語をまっち

;;igrep.el
(require 'igrep)
;;lgrepに-0u8オプションをつけるとUTF8
(igrep-define lgrep (igrep-use-zgrep nil) (igrep-regexp-option "-n -0u8"))
(igrep-find-define lgrep (igrep-use-zgrep nil) (igrep-regexp-option "-n -0u8"))

;;grep-a-lot
(require 'grep-a-lot)
(grep-a-lot-setup-keys)

;;igrep用
(grep-a-lot-advise igrep)

;;grep-edit
(require 'grep-edit)

;;;-----------------------------------------------
;;;キーバインディング
;;;-----------------------------------------------


;;;-----------------------------------------------
;;;org-modeによる文書処理
;;;-----------------------------------------------
;;基本設定
(require 'org)

;;メモをとる
;; org-rememberを使う
(org-remember-insinuate)
;; org-rememberのテンプレート
(setq org-remember-templates
      '(("Note" ?n "* %?\n  %i\n  %a" nil "Tasks")
	("Todo" ?t "* TODO %?\n  %i\n  %a" nil "Tasks")))
;;Todo
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
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
;; Windows 固有の設定
;;-----------------------------------------------
;;cygwin-mount
;(when (eq system-type 'windows-nt)
;  (require 'cygwin-mount)
;  (cygwin-mount-activate))

;;-----------------------------------------------
;; HOWM
;;-----------------------------------------------
;;ロード
(require 'howm)
;;メニューの言語は日本語
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f)
   (autoload f
     "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))

;; 自動更新しない 
(setq howm-menu-refresh-after-save nil)

;; リフレッシュしない
(setq howm-refresh-after-save nil)


;;-----------------------------------------------
;; mewを使ってメール
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
;; W3Mを使った ブラウジング
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
;; はてな
;; -----------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; simple-hatena-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'simple-hatena-mode)
(require 'hatenahelper-mode)
(add-hook 'simple-hatena-mode-hook
          '(lambda ()
             (hatenahelper-mode 1)))

(setq simple-hatena-default-id "Crest")

;; はてダラスクリプトのパス(デフォルト値: hw.pl)
(setq simple-hatena-bin "~/.emacs.d/bin/hw.pl")

;; はてダラデータを置くディレクトリ(デフォルト値: ~/.hatena)
(setq simple-hatena-root "~/.emacs.d/hatena")

;; はてダラで使うデフォルトのはてなid(デフォルト値: nil)
(setq simple-hatena-default-id "Crest")

;;; ;; はてダラで使うデフォルトのグループ名(デフォルト値: nil)
;;; (setq simple-hatena-default-group "subtech")

;; はてなダイアリーライターのユーザエージェントオプション(デフォルト値:
;; simple-hatena-mode/vヴァージョン番号)
(setq simple-hatena-option-useragent "Hatena::Diary::Writer")

;; はてなダイアリーライターのパーマリンクに、タイムスタンプを使うかどう
;; かを指定する(デフォルト値: t)
(setq simple-hatena-use-timestamp-permalink-flag nil)

;; 日付を計算する際に用いるオフセット。たとえば以下のように6に設定する
;; と、午前6時まで前日の日付として扱われる(デフォルト値: nil)
(setq simple-hatena-time-offset 6)

;; はてなダイアリーライターのデバッグモードオプション(デフォルト値: nil)
(setq simple-hatena-option-debug-flag t)

;; はてなダイアリーライターのタイムアウトオプション(デフォルト値: 30秒)
(setq simple-hatena-option-timeout 30)

;; はてなダイアリーライターのクッキーオプション(デフォルト値: t)
(setq simple-hatena-option-cookie-flag t)

;; はてダラを実行するプロセスのバッファ名(デフォルト値: *SimpleHatena*)
(setq simple-hatena-process-buffer-name "*SimpleHatena*")

(define-key simple-hatena-mode-map (kbd "C-c C-v") 'simple-hatena-version)
(define-key simple-hatena-mode-map (kbd "C-c C-c") 'simple-hatena-submit)
(define-key simple-hatena-mode-map (kbd "C-c C-p") 'simple-hatena-trivial-submit)
(define-key simple-hatena-mode-map (kbd "C-c C-i") 'simple-hatena-change-default-id)
(define-key simple-hatena-mode-map (kbd "C-c C-g") 'simple-hatena-change-default-group)
(define-key simple-hatena-mode-map (kbd "C-c C-n") 'simple-hatena-find-diary-for)
(define-key simple-hatena-mode-map (kbd "C-c C-b") 'simple-hatena-go-back)
(define-key simple-hatena-mode-map (kbd "C-c C-f") 'simple-hatena-go-forward)
(define-key simple-hatena-mode-map (kbd "C-c C-d") 'simple-hatena-toggle-debug-mode)
(define-key simple-hatena-mode-map (kbd "C-c C-e") 'simple-hatena-exit)
(define-key simple-hatena-mode-map (kbd       "*") 'simple-hatena-electric-asterisk)

;;;hatena起動
;; C-c h で起動
(global-set-key "\C-ch" 'simple-hatena)

;(require 'hatena-diary-api)
;(require 'hatena-diary)
;(require 'hatena-markup-mode)
;(setq hatena:d:major-mode 'hatena:markup-mode)
;(load-file "~/.emacs.d/etc/hatena-conf")

;(add-to-list 'load-path "~/.emacs.d/plugins/simple-hatena-mode/")
;(require 'simple-hatena-mode)
;(setq simple-hatena-default-id "Crest")
;(setq simple-hatean-bin "/usr/bin/hw.pl")
;; ;;hatena-modeとhatenahelper-mode用
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
;;    `hatena-use-file' を non-nil にするとパスワードを base64 で
;;    暗号化してファイルに保存しますが、"人間が見てすぐわからない"ぐらいの
;;    意味しかないので注意して下さい。
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
;;ユーザ名
(setq twittering-username "thayamizu")
;;更新間隔120sec
(setq twittering-timer-interval 120)
;;アイコン表示
(setq twittering-icon-mode t)
;;スクロールする
(setq twittering-scroll-mode t)

;;前回起動時の状態を復元する
;(resume)


;;サーバー起動
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


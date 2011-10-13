;;; -*- coding: utf-8; mode: emacs-lisp; indent-tabs-mode: nil -*-
;;; simple-hatena-mode.el --- Emacs interface to Hatena::Diary Writer

;; Copyright (C) 2007 Kentaro Kuribayashi
;; Author: Kentaro Kuribayashi <kentarok@gmail.com>
;; Keywords: blog, hatena, 縺ｯ縺ｦ縺ｪ

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 2, or (at your
;; option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; * simple-hatena-mode.el縺ｫ縺､縺����※

;; 縺薙����繝代ャ繧ｱ繝ｼ繧ｸ縺ｯ縲√�後����縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縲阪ｒEmacs縺九ｉ菴ｿ縺医ｋ繧医≧
;; 縺ｫ縺励�√����縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ/繧ｰ繝ｫ繝ｼ繝玲律險倥ｒ邁｡蜊倥↓譖ｴ譁ｰ縺吶ｋ縺溘ａ縺ｮ繝｡繧ｸ繝｣繝ｼ繝｢繝ｼ
;; 繝峨�《imple-hatena-mode繧呈署萓帙＠縺ｾ縺吶�Ｔimple-hatena-mode縺ｯ縲�
;; html-helper-mode縺ｮ豢ｾ逕溘Δ繝ｼ繝峨→縺励※螳夂ｾｩ縺輔ｌ縺ｦ縺����∪縺吶����縺ｧ縲�
;; html-helper-mode縺梧署萓帙☆繧句推遞ｮ讖溯����繧ょ茜逕ｨ縺ｧ縺阪∪縺吶��
;;
;; 繧､繝ｳ繧ｹ繝医����繝ｫ縲∬ｨｭ螳壽婿豕慕ｭ峨↓縺､縺����※縺ｯ縲∽ｻ･荳九����繝壹����繧ｸ繧偵＃隕ｧ縺上□縺輔＞縲�
;; http://coderepos.org/share/wiki/SimpleHatenaMode

;;; Code:

;;;; * 繝ｴ繧｡繝ｼ繧ｸ繝ｧ繝ｳ

(defconst simple-hatena-version "0.15"
  "simple-hatena-mode.el縺ｮ繝ｴ繧｡繝ｼ繧ｸ繝ｧ繝ｳ縲�")

(defun simple-hatena-version ()
  "simple-hatena-mode.el縺ｮ繝ｴ繧｡繝ｼ繧ｸ繝ｧ繝ｳ繧定｡ｨ遉ｺ縺吶ｋ縲�"
  (interactive)
  (let ((version-string
         (format "simple-hatena-mode-v%s" simple-hatena-version)))
    (if (interactive-p)
        (message "%s" version-string)
      version-string)))

;;;; * 繝ｦ繝ｼ繧ｶ縺ｫ繧医ｋ繧ｫ繧ｹ繧ｿ繝槭う繧ｺ縺悟庄閭ｽ縺ｪ險ｭ螳�

;; 繧ｫ繧ｹ繧ｿ繝槭う繧ｺ螟画焚
(defvar simple-hatena-bin "hw.pl"
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縺ｮ繝代せ繧呈欠螳壹☆繧九��")

(defvar simple-hatena-root "~/.hatena"
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縺ｮ繝��������繧ｿ繧堤ｽｮ縺上ョ繧｣繝ｬ繧ｯ繝医Μ縺ｮ繝ｫ繝ｼ繝医ｒ謖�
螳壹☆繧九��")

(defvar simple-hatena-default-id nil
  "*縺ｯ縺ｦ繝�繝ｩ縺ｧ菴ｿ縺����ョ繝輔か繝ｫ繝医����縺ｯ縺ｦ縺ｪid繧呈欠螳壹☆繧九��

縺薙����螟画焚縺瑚ｨｭ螳壹＆繧後※縺����ｋ蝣ｴ蜷医�《imple-hatena縺ゅｋ縺��������
simple-hatena-group螳溯｡梧凾縺ｫ縲∬ｨｭ螳壹＆繧後◆id縺御ｽｿ繧上ｌ繧九◆繧√�（d繧帝∈謚�
縺吶ｋ蠢����ｦ√′縺ｪ縺������

縺薙����id繧貞､画峩縺吶ｋ縺ｫ縺ｯ縲《imple-hatena-change-default-id繧貞ｮ溯｡後☆繧九��")

(defvar simple-hatena-default-group nil
  "*繝����ヵ繧ｩ繝ｫ繝医げ繝ｫ繝ｼ繝怜錐繧呈欠螳壹☆繧九��")

(defvar simple-hatena-use-timestamp-permalink-flag t
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縺ｮ繝代����繝槭Μ繝ｳ繧ｯ縺ｫ縲√ち繧､繝�繧ｹ繧ｿ繝ｳ繝励ｒ菴ｿ縺�
縺九←縺����°繧呈欠螳壹☆繧九ヵ繝ｩ繧ｰ縲�")

(defvar simple-hatena-time-offset nil
  "*譌･莉倥ｒ險育ｮ励☆繧矩圀縺ｫ逕ｨ縺����ｋ繧ｪ繝輔そ繝����ヨ縲�
6 縺ｫ險ｭ螳壹☆繧九→蜊亥燕6譎ゅ∪縺ｧ蜑肴律縺ｮ譌･莉倥→縺励※謇ｱ繧上ｌ繧�")

;; 縺ｯ縺ｦ繝�繝ｩ縺ｫ繧上◆縺吶が繝励す繝ｧ繝ｳ
(defvar simple-hatena-option-useragent (simple-hatena-version)
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縺ｮ繝ｦ繝ｼ繧ｶ繧ｨ繝ｼ繧ｸ繧ｧ繝ｳ繝医が繝励す繝ｧ繝ｳ繧呈欠螳壹☆
繧九��

螳溯｡梧凾縺ｫ縲�-a繧ｪ繝励す繝ｧ繝ｳ縺ｨ縺励※菴ｿ繧上ｌ繧九��")

(defvar simple-hatena-option-debug-flag nil
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ繧偵�√ョ繝舌ャ繧ｰ繝｢繝ｼ繝峨〒螳溯｡後☆繧九°蜷ｦ縺九ｒ謖�
螳壹☆繧九ヵ繝ｩ繧ｰ縲�

縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ螳溯｡梧凾縺ｫ縲�-d繧ｪ繝励す繝ｧ繝ｳ縺ｨ縺励※繧上◆縺輔ｌ縲√∪縺溘��
縺昴����蝣ｴ蜷医�∝ｮ溯｡檎ｵ先棡繧偵ヰ繝����ヵ繧｡縺ｫ陦ｨ遉ｺ縺吶ｋ縲�

繝����ヰ繝����げ繝｢繝ｼ繝峨ｒ繧ｪ繝ｳ/繧ｪ繝輔☆繧九↓縺ｯ縲�
simple-hatena-toggle-debug-mode繧貞ｮ溯｡後☆繧九��")

(defvar simple-hatena-option-timeout 30
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縺ｮ繧ｿ繧､繝�繧｢繧ｦ繝医ｒ謖����ｮ壹☆繧九��

螳溯｡梧凾縺ｫ縲�-T繧ｪ繝励す繝ｧ繝ｳ縺ｨ縺励※菴ｿ繧上ｌ繧九��")

(defvar simple-hatena-option-cookie-flag t
  "*縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ縺ｮ繝ｭ繧ｰ繧､繝ｳ縺ｫ縲…ookie繧貞茜逕ｨ縺吶ｋ縺九←縺����°
繧呈欠螳壹☆繧九ヵ繝ｩ繧ｰ縲�

螳溯｡梧凾縺ｫ縲�-c繧ｪ繝励す繝ｧ繝ｳ縺ｨ縺励※菴ｿ繧上ｌ繧九��")

(defvar simple-hatena-process-buffer-name "*SimpleHatena*"
  "*縺ｯ縺ｦ繝�繝ｩ繧貞ｮ溯｡後☆繧九����繝ｭ繧ｻ繧ｹ縺ｮ繝舌ャ繝輔ぃ蜷阪��")

;; 繧ｭ繝ｼ繝舌う繝ｳ繝�
(setq simple-hatena-mode-map (make-keymap))

(define-key simple-hatena-mode-map (kbd "C-c C-v") 'simple-hatena-version)
(define-key simple-hatena-mode-map (kbd "C-c C-p") 'simple-hatena-submit)
(define-key simple-hatena-mode-map (kbd "C-c C-c") 'simple-hatena-trivial-submit)
(define-key simple-hatena-mode-map (kbd "C-c   *") 'simple-hatena-timestamp)
(define-key simple-hatena-mode-map (kbd "C-c C-i") 'simple-hatena-change-default-id)
(define-key simple-hatena-mode-map (kbd "C-c C-g") 'simple-hatena-change-default-group)
(define-key simple-hatena-mode-map (kbd "C-c C-n") 'simple-hatena-find-diary-for)
(define-key simple-hatena-mode-map (kbd "C-c C-b") 'simple-hatena-go-back)
(define-key simple-hatena-mode-map (kbd "C-c C-f") 'simple-hatena-go-forward)
(define-key simple-hatena-mode-map (kbd "C-c C-d") 'simple-hatena-toggle-debug-mode)
(define-key simple-hatena-mode-map (kbd "C-c C-e") 'simple-hatena-exit)
(define-key simple-hatena-mode-map (kbd       "*") 'simple-hatena-electric-asterisk)

;; 繝輔ャ繧ｯ
(defvar simple-hatena-mode-hook nil
  "simple-hatena-mode髢句ｧ区凾縺ｮ繝輔ャ繧ｯ縲�")
(defvar simple-hatena-before-submit-hook nil
  "譌･險倥ｒ謚慕ｨｿ縺吶ｋ逶ｴ蜑阪����繝輔ャ繧ｯ")
(defvar simple-hatena-after-submit-hook nil
  "譌･險倥ｒ謚慕ｨｿ縺励◆逶ｴ蠕後����繝輔ャ繧ｯ")

;; 繝輔か繝ｳ繝医Ο繝����け

(defvar simple-hatena-font-lock-keywords nil)
(defvar simple-hatena-slag-face 'simple-hatena-slag-face)
(defvar simple-hatena-subtitle-face 'simple-hatena-subtitle-face)
(defvar simple-hatena-inline-face 'simple-hatena-inline-face)
(defvar simple-hatena-markup-face 'simple-hatena-markup-face)
(defvar simple-hatena-link-face 'simple-hatena-link-face)

(defface simple-hatena-slag-face
  '((((class color) (background light)) (:foreground "IndianRed"))
    (((class color) (background dark)) (:foreground "wheat")))
  "蟆剰ｦ句����縺励����*繧ｿ繧､繝�繧ｹ繧ｿ繝ｳ繝熔r繧ｹ繝ｩ繝����げ*驛ｨ蛻��������繝輔ぉ繧､繧ｹ縲�")

(defface simple-hatena-subtitle-face
  '((((class color) (background light)) (:foreground "DarkOliveGreen"))
    (((class color) (background dark)) (:foreground "wheat")))
  "蟆剰ｦ句����縺励����繝輔ぉ繧､繧ｹ縲�")

(defface simple-hatena-inline-face
  '((((class color) (background light)) (:foreground "MediumBlue" :bold t))
    (((class color) (background dark)) (:foreground "wheat" :bold t)))
  "id險俶ｳ輔ｄ[keyword:Emacs]遲峨����face")

(defface simple-hatena-markup-face
  '((((class color) (background light)) (:foreground "DarkOrange" :bold t))
    (((class color) (background dark)) (:foreground "IndianRed3" :bold t)))
  "縺ｯ縺ｦ縺ｪ縺ｮ繝槭����繧ｯ繧｢繝��������縺ｮ繝輔ぉ繧､繧ｹ縲�")

(defface simple-hatena-link-face
  '((((class color) (background light)) (:foreground "DeepPink"))
    (((class color) (background dark)) (:foreground "wheat")))
  "繝ｪ繝ｳ繧ｯ縺ｮ繝輔ぉ繧､繧ｹ縲�")

;;;; * 螳溯｣�

(eval-when-compile
  (require 'cl)
  (require 'derived)
  (require 'font-lock)
  (require 'html-helper-mode))

(defconst simple-hatena-filename-regex
   "/\\([^/]+\\)/\\(diary\\|group\\)/\\([^/]+\\)?/?\\([0-9][0-9][0-9][0-9]\\)-\\([01][0-9]\\)-\\([0-3][0-9]\\)\.txt"
  "譌･險倥ヵ繧｡繧､繝ｫ縺ｮ豁｣隕剰｡ｨ迴ｾ縲ゅ����繝����メ縺励◆蝣ｴ蜷医�∽ｻ･荳九����繧､繝ｳ繝����ャ繧ｯ繧ｹ縺ｫ繧�
繧翫ヵ繧｡繧､繝ｫ諠�����ｱ繧貞叙蠕励〒縺阪ｋ縲�

  0. 繝槭ャ繝√＠縺溷����菴�
  1. 縺ｯ縺ｦ縺ｪid
  2. diary/group
  3. 2縺携roup縺ｮ蝣ｴ蜷医����縲√げ繝ｫ繝ｼ繝怜錐縲ゅ◎縺����〒縺ｪ縺�����ｴ蜷医����nil
  4. 蟷ｴ(YYYY)
  5. 譛�(MM)
  6. 譌･(DD)")

;; 縺ｯ縺ｦ縺ｪID縺ｮ豁｣隕剰｡ｨ迴ｾ
;; > http://d.hatena.ne.jp/keyword/%A4%CF%A4%C6%A4%CAID
;; > 螟ｧ譁����ｭ励≠繧九＞縺ｯ蟆乗枚蟄励����繧｢繝ｫ繝輔ぃ繝吶ャ繝医����0-9縺ｮ謨ｰ蟄励����縲�-縲阪����縲契縲�(縺����★繧後ｂ
;; 蜊願ｧ�)縺ｮ縺����★繧後°繧�3-32譁����ｭ嶺ｸｦ縺ｹ縺溘ｂ縺ｮ(縺溘□縺玲怙蛻昴����譁����ｭ励����繧｢繝ｫ繝輔ぃ繝吶ャ繝医〒
;; 縺ゅｋ縺薙→)縺九ｉ謌舌ｋ縲�
(defconst simple-hatena-id-regex
  "^[A-z][\-_A-z0-9]+[A-z0-9]$"
  "")

;; 縺ｯ縺ｦ縺ｪ繧ｰ繝ｫ繝ｼ繝怜錐縺ｮ豁｣隕剰｡ｨ迴ｾ
;; > http://g.hatena.ne.jp/group?mode=append
;; > ����医い繝ｫ繝輔ぃ繝吶ャ繝医〒蟋九∪繧翫�√い繝ｫ繝輔ぃ繝吶ャ繝医°謨ｰ蟄励〒邨ゅｏ繧�3譁����ｭ嶺ｻ･荳翫��
;; > 24譁����ｭ嶺ｻ･蜀��������蜊願ｧ定恭謨ｰ蟄暦ｼ�
;; 縺ｨ譖ｸ縺九ｌ縺ｦ縺����ｋ縺後��-縲阪ｂ菴ｿ縺医ｋ縲�
(defconst simple-hatena-group-regex
  "^[A-z][\-A-z0-9]+[A-z0-9]$"
  "")

;; simple-hatena-mode繧偵�”tml-helper-mode縺ｮ豢ｾ逕溘Δ繝ｼ繝峨→縺励※螳夂ｾｩ縺吶ｋ縲�
(define-derived-mode simple-hatena-mode html-helper-mode "Simple Hatena"
  "縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ繝ｩ繧､繧ｿ繝ｼ繧偵�・macs縺九ｉ蛻ｩ逕ｨ縺吶ｋ縺溘ａ縺ｮ繧､繝ｳ繧ｿ繝輔ぉ繧､
繧ｹ繧呈署萓帙☆繧九Δ繝ｼ繝峨��

險ｭ螳壽婿豕輔ｄ菴ｿ縺����婿縺ｫ縺､縺����※縺ｯ縲∽ｻ･荳九ｒ蜿ら����縺ｮ縺薙→縲�
http://coderepos.org/share/wiki/SimpleHatenaMode"

  ;; 迴ｾ蝨ｨ髢九＞縺ｦ縺����ｋ繝舌ャ繝輔ぃ縺ｮ諠�����ｱ
  (make-local-variable 'simple-hatena-local-current-buffer-info)
  (make-local-variable 'simple-hatena-local-current-buffer-id)
  (make-local-variable 'simple-hatena-local-current-buffer-type)
  (make-local-variable 'simple-hatena-local-current-buffer-group)
  (make-local-variable 'simple-hatena-local-current-buffer-year)
  (make-local-variable 'simple-hatena-local-current-buffer-month)
  (make-local-variable 'simple-hatena-local-current-buffer-day)

  (if (string-match simple-hatena-filename-regex (buffer-file-name))
      (progn
        (setq simple-hatena-local-current-buffer-info
              (match-string 0 (buffer-file-name)))
        (setq simple-hatena-local-current-buffer-id
              (match-string 1 (buffer-file-name)))
        (setq simple-hatena-local-current-buffer-type
              (match-string 2 (buffer-file-name)))
        (setq simple-hatena-local-current-buffer-group
              (match-string 3 (buffer-file-name)))
        (setq simple-hatena-local-current-buffer-year
              (match-string 4 (buffer-file-name)))
        (setq simple-hatena-local-current-buffer-month
              (match-string 5 (buffer-file-name)))
        (setq simple-hatena-local-current-buffer-day
              (match-string 6 (buffer-file-name)))
        (simple-hatena-update-modeline))
    (error "Current buffer isn't related to Hatena::Diary Writer data file"))

  ;; 繝輔か繝ｳ繝医Ο繝����け
  (font-lock-add-keywords 'simple-hatena-mode
    (list
     (list  "^\\(\\*[*a-zA-Z0-9_-]*\\)\\(.*\\)$"
            '(1 simple-hatena-slag-face t)
            '(2 simple-hatena-subtitle-face t))
     ;; 蠢����★[]縺ｧ蝗ｲ縺ｾ繧後※縺����↑縺代ｌ縺ｰ縺ｪ繧峨↑縺����ｂ縺ｮ
     (list "\\[[*a-zA-Z0-9_-]+\\(:[^\n]+\\)+\\]"
           '(0 simple-hatena-inline-face t))
     ;; 蠢����★縺励ｂ[]縺ｧ蝗ｲ縺ｾ繧後※縺����↑縺上※繧ゅｈ縺����ｂ縺ｮ
     (list "\\[?\\(id\\|a\\|b\\|d\\|f\\|g\\|graph\\|i\\|idea\\|map\\|question\\|r\\|isbn\\|asin\\)\\(:[a-zA-Z0-9_+:-]+\\)+\\]?"
           '(0 simple-hatena-inline-face t))
     (list  "^\\(:\\)[^:\n]+\\(:\\)"
            '(1 simple-hatena-markup-face t)
            '(2 simple-hatena-markup-face t))
     (list  "^\\([-+]+\\)"
            '(1 simple-hatena-markup-face t))
     (list  "\\(((\\).*\\())\\)"
            '(1 simple-hatena-markup-face t)
            '(2 simple-hatena-markup-face t))
     (list  "^\\(>>\\|<<\\|><!--\\|--><\\|>|?[^|]*|\\||?|<\\|=====?\\)"
            '(1 simple-hatena-markup-face t))
     (list  "\\(s?https?://\[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#\]+\\)"
            '(1 simple-hatena-link-face t))))
  (font-lock-mode 1)

  (use-local-map simple-hatena-mode-map)
  (run-hooks 'simple-hatena-mode-hook))

;; 縺ｯ縺ｦ繝�繝ｩ繝��������繧ｿ縺ｫsimple-hatena-mode繧帝←逕ｨ縺吶ｋ
;;
;; - ~/.hatena/hatena-id/diary/YYYY-MM-DD.txt
;; - ~/.hatena/hatena-id/group/group-name/YYYY-MM-DD.txt
;;
;; 縺ｨ縺����≧繝輔ぃ繧､繝ｫ繧帝幕縺����◆繧峨�《imple-hatena-mode縺ｫ縺吶ｋ
(add-to-list 'auto-mode-alist
             (cons simple-hatena-filename-regex 'simple-hatena-mode))

;;;; * 繧ｳ繝槭Φ繝�

(defun simple-hatena-setup ()
  (interactive)
  "繝����ぅ繝ｬ繧ｯ繝医Μ驟咲ｽｮ繧偵そ繝����ヨ繧｢繝��������縺吶ｋ縲�"
  (and
   ;; simple-hatena-bin
   (simple-hatena-setup-check-hatena-bin-exists-p)

   ;; hatena id(s)
   (simple-hatena-setup-id)

   ;; hatena group
   (if (y-or-n-p
        "Set up about `Hatena::Group' next? ")
       (simple-hatena-group-setup)
     (message "Enjoy!"))))

(defun simple-hatena-setup-check-hatena-bin-exists-p ()
  (if (file-executable-p simple-hatena-bin)
      t
    (progn
      (if (y-or-n-p
           (format
            "`Hatena Diary Writer' not found in %s. Are you sure to continue setup? "
            simple-hatena-bin))
          t
        (progn
          (when (y-or-n-p
                 "Open the documentation of simple-hatnea-mode in your browser? ")
            (browse-url "http://coderepos.org/share/wiki/SimpleHatenaMode"))
          (message "You must download and install `Hatena Diary Writer' first")
          nil)))))

(defun simple-hatena-setup-id ()
  (let
      ((ids (list)))
    (when (file-directory-p simple-hatena-root)
      (dolist (id (simple-hatena-internal-list-directories simple-hatena-root))
        (add-to-list 'ids id)))

    (when simple-hatena-default-id
      (add-to-list 'ids simple-hatena-default-id))

    (while
        (or (not ids) ;;FIXME incomprehensible.
            (y-or-n-p
             (format
              "Existing id(s): `%s'\nSet up other id? "
              (mapconcat 'identity
                         ids "', `"))))
      (add-to-list
       'ids (simple-hatena-read-string-and-match-check
             "Please input your other Hatena id: "
             simple-hatena-id-regex
             "`%s' is invalid as a Hatena id.")))

    (dolist (id ids)
      (simple-hatena-setup-id-create-directory-and-file id))
    ids))

(defun simple-hatena-setup-id-create-directory-and-file (id)
  (simple-hatena-setup-create-directory-and-file
   (expand-file-name
    (format "%s/%s/diary/config.txt"
            simple-hatena-root id))))

(defun simple-hatena-group-setup ()
  (interactive)
  "繝����ぅ繝ｬ繧ｯ繝医Μ縺ｫ縺ｯ縺ｦ縺ｪ繧ｰ繝ｫ繝ｼ繝励ｒ霑ｽ蜉�縺吶ｋ縲�"
  ;; hatena group(s)
  (simple-hatena-setup-group))

(defun simple-hatena-setup-group ()
  (let*
      ((groups (list))
       (id (condition-case err
               simple-hatena-local-current-buffer-id
             (error (simple-hatena-internal-completing-read-id
                     simple-hatena-root))))
       (group-dir (expand-file-name (format "%s/%s/group"
                                            simple-hatena-root id))))

    (unless (file-directory-p group-dir)
      (make-directory group-dir 'parents))

    (dolist (group (simple-hatena-internal-list-directories group-dir))
      (add-to-list 'groups group))

    (while
        (or (not groups)
            (y-or-n-p
             (format
              "Existing group(s): `%s'\nSet up other group? "
              (mapconcat 'identity
                         groups "', `"))))
      (add-to-list
       'groups (simple-hatena-read-string-and-match-check
                (format
                 "Please input a group name for id:%s: " id)
                simple-hatena-group-regex
             "`%s' is invalid as a group name.")))

    (dolist (group groups)
      (if (string-match simple-hatena-group-regex group)
          (simple-hatena-setup-group-create-directory-and-file id group)
        (message (format "`%s' is invalid as a group name." group))))))

(defun simple-hatena-setup-group-create-directory-and-file (id group)
  (simple-hatena-setup-create-directory-and-file
   (expand-file-name
    (format "%s/%s/group/%s/config.txt"
            simple-hatena-root id group))))

(defun simple-hatena-setup-create-directory-and-file (filename)
  "Set up a directory and file.

NOTE: Create intermediate directories as required."
  (let
      ((dirname (file-name-directory filename)))
    (unless (file-exists-p filename)
      (unless (file-directory-p dirname)
        (make-directory dirname 'parents))
      (append-to-file 1 1 filename))))

(defun simple-hatena-read-string-and-match-check (prompt regex
                                                         &optional errmsg)
  "Read a string from the minibuffer, prompting with string prompt,
and Cheking input value.

If non-nil, third args, you can set error message.

NOTE: Please refer to `format' for the format of the error
message."
  (let
      ((input nil)
       (errmsg (or errmsg
                   "Your input is invalid...")))
    (while
        (and
         (setq input (read-string prompt))
         (not (string-match regex input)))
      (message (format errmsg input))
      (sleep-for 1))
    input))

(defun simple-hatena (id)
  "螳溯｡梧律迴ｾ蝨ｨ縺ｮ譌･莉倥����繝輔ぃ繧､繝ｫ繧帝幕縺上��"
  (interactive
   (list
    (if simple-hatena-default-id
        simple-hatena-default-id
      (simple-hatena-internal-completing-read-id simple-hatena-root))))
  (simple-hatena-internal-safe-find-file (concat
               simple-hatena-root
               "/"
               id
               "/diary/"
               (simple-hatena-internal-make-diary-file-string 0))))

(defun simple-hatena-group (id group)
  "螳溯｡梧律迴ｾ蝨ｨ縺ｮ譌･莉倥����縲∵欠螳壹＆繧後◆繧ｰ繝ｫ繝ｼ繝励↓謚慕ｨｿ縺吶ｋ縺溘ａ縺ｮ繝輔ぃ繧､繝ｫ
繧帝幕縺上��"
  (interactive
   (if simple-hatena-default-id
       (list
        simple-hatena-default-id
        (if simple-hatena-default-group
            simple-hatena-default-group
          (simple-hatena-internal-completing-read-group simple-hatena-default-id)))
     (let ((id (simple-hatena-internal-completing-read-id simple-hatena-root)))
       (list
        id
        (if simple-hatena-default-group
            simple-hatena-default-group
          (simple-hatena-internal-completing-read-group id))))))
  (simple-hatena-internal-safe-find-file (concat
              simple-hatena-root
              "/"
              id
              "/group/"
              group
              "/"
              (simple-hatena-internal-make-diary-file-string 0))))

(defun simple-hatena-change-default-id ()
  "迴ｾ蝨ｨ縺ｮ繝����ヵ繧ｩ繝ｫ繝����d繧貞､画峩縺吶ｋ縲�"
  (interactive)
  (setq simple-hatena-default-id
        (simple-hatena-internal-completing-read-id simple-hatena-root))
  (message "Changed current default id to %s" simple-hatena-default-id))

(defun simple-hatena-change-default-group ()
  "迴ｾ蝨ｨ縺ｮ繝����ヵ繧ｩ繝ｫ繝医げ繝ｫ繝ｼ繝励ｒ螟画峩縺吶ｋ縲�"
  (interactive)
  (if simple-hatena-default-id
      (setq simple-hatena-default-group
            (simple-hatena-internal-completing-read-group simple-hatena-default-id))
    (list (simple-hatena-change-default-id)
          (setq simple-hatena-default-group
                (simple-hatena-internal-completing-read-group simple-hatena-default-id))))
  (message "Change current default group to %s" simple-hatena-default-group))

(defun simple-hatena-submit ()
  "縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ/繧ｰ繝ｫ繝ｼ繝励↓謚慕ｨｿ縺吶ｋ縲�"
  (interactive)
  (simple-hatena-internal-do-submit))

(defun simple-hatena-trivial-submit ()
  "縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ繝ｼ/繧ｰ繝ｫ繝ｼ繝励↓縲後■繧����▲縺ｨ縺励◆譖ｴ譁ｰ縲阪〒謚慕ｨｿ縺吶ｋ縲�"
  (interactive)
  (simple-hatena-internal-do-submit "-t"))

(defun simple-hatena-timestamp ()
  "螳溯｡御ｽ咲ｽｮ縺ｫ縲√��*繧ｿ繧､繝�繧ｹ繧ｿ繝ｳ繝�*縲阪ｒ謖ｿ蜈･縺吶ｋ縲�"
  (interactive)
  (insert (format-time-string "*%s*" (current-time))))

(defun simple-hatena-find-diary-for (date)
  "謖����ｮ壹＆繧後◆譌･莉倥����譌･險倥ヰ繝����ヵ繧｡繧定｡ｨ遉ｺ縺吶ｋ縲�"
  (interactive "sDate(YYYY-MM-DD): ")
  (if (equal major-mode 'simple-hatena-mode)
      (if (string-match "^[0-9][0-9][0-9][0-9]-[01][0-9]-[0-3][0-9]$" date)
          (simple-hatena-internal-safe-find-file
           (concat (file-name-directory (buffer-file-name))
                   (concat date ".txt")))
        (error "Invalid date"))
    (error "Current major mode isn't simple-hatena-mode")))

(defun simple-hatena-go-forward (&optional i)
  "蜑阪����譌･莉倥∈遘ｻ蜍輔☆繧九�ょ燕鄂ｮ蠑墓焚縺梧ｸ｡縺輔ｌ縺溷�ｴ蜷医����縲√◎縺ｮ謨ｰ縺�縺大ｾ後����譌･莉倥↓遘ｻ蜍輔☆繧九��"
  (interactive "p")
  (if (not i)
      (simple-hatena-internal-go-for 1)
    (simple-hatena-internal-go-for i)))

(defun simple-hatena-go-back (&optional i)
  "谺｡縺ｮ譌･莉倥∈遘ｻ蜍輔☆繧九�ょ燕鄂ｮ蠑墓焚縺梧ｸ｡縺輔ｌ縺溷�ｴ蜷医����縲√◎縺ｮ謨ｰ縺�縺大燕縺ｮ譌･莉倥↓遘ｻ蜍輔☆繧九��"
  (interactive "p")
  (if (not i)
      (simple-hatena-internal-go-for -1)
    (simple-hatena-internal-go-for (- i))))

(defun simple-hatena-toggle-debug-mode ()
  "繝����ヰ繝����げ繝｢繝ｼ繝峨ｒ繧ｪ繝ｳ/繧ｪ繝輔☆繧九��"
  (interactive)
  (if simple-hatena-option-debug-flag
      (progn
        (setq simple-hatena-option-debug-flag nil)
        (message "Debug mode off"))
    (progn
      (setq simple-hatena-option-debug-flag t)
      (message "Debug mode on"))))

(defun simple-hatena-exit ()
  "simple-hatena-mode縺ｮ驕ｩ逕ｨ縺輔ｌ縺ｦ縺����ｋ繝舌ャ繝輔ぃ繧貞����縺ｦ蜑企勁縺吶ｋ縲�"
  (interactive)
  (dolist (buffer (buffer-list))
    (when (and
           (buffer-file-name buffer)
           (string-match simple-hatena-filename-regex (buffer-file-name buffer)))
      (when (buffer-modified-p buffer)
        (progn
          (save-current-buffer
            (set-buffer buffer)
            (save-buffer))))
      (kill-buffer buffer)))
  (message "simple-hatena-mode has been exited"))

(defun simple-hatena-electric-asterisk (arg)
  "�����(繧｢繧ｹ繧ｿ繝ｪ繧ｹ繧ｯ)謚ｼ荳九↓繧医ｊ縲√ち繧､繝�繧ｹ繧ｿ繝ｳ繝嶺ｻ倥″蟆剰ｦ句����縺励ｒ謖ｿ蜈･縺吶ｋ縲�

繝昴う繝ｳ繝医′陦碁�ｭ縺ｫ縺ゅｋ蝣ｴ蜷医����縺ｿ縲√ち繧､繝�繧ｹ繧ｿ繝ｳ繝励ｒ謖ｿ蜈･縺励�√◎縺ｮ莉悶����蝣ｴ蜷�
縺ｯ縲�����壼ｸｸ騾壹ｊ繧｢繧ｹ繧ｿ繝ｪ繧ｹ繧ｯ繧呈諺蜈･縺吶ｋ縲�"
  (interactive "*p")
  (if (and simple-hatena-use-timestamp-permalink-flag
           (zerop (current-column)))
      (simple-hatena-timestamp)
    (self-insert-command arg)))

;;;; * 蜀����Κ髢｢謨ｰ

(defun simple-hatena-internal-safe-find-file (filename)
  "譁ｰ縺励＞繝ｴ繧｡繝ｼ繧ｸ繝ｧ繝ｳ縺ｮhtml-helper-mode縺ｯ縲√ョ繝輔か繝ｫ繝医〒繧ｹ繧ｱ繝ｫ繝医Φ
繧剃ｽ懊▲縺ｦ繧ｦ繧ｶ縺��������縺ｧ縲����仆豁｢縺吶ｋ縲�"
  (let ((html-helper-build-new-buffer nil))
    (find-file filename)))

(defun simple-hatena-internal-make-diary-file-string (i &optional date)
  "date縺梧欠螳壹＆繧後※縺����↑縺�����ｴ蜷医����縲∝ｮ溯｡梧律迴ｾ蝨ｨ縺ｮ譌･莉倥ｒ襍ｷ轤ｹ縺ｫ縺励◆譌･險倥ヵ繧｡繧､繝ｫ蜷阪ｒ逕滓����縺吶ｋ縲�

   0: 莉頑律
   1: 譏取律
  -1: 譏ｨ譌･

謖����ｮ壹＆繧後※縺����ｋ蝣ｴ蜷医����縲√◎縺ｮ譌･莉倥ｒ襍ｷ轤ｹ縺ｫ縺励◆譌･險倥ヵ繧｡繧､繝ｫ蜷阪ｒ逕滓����縺吶ｋ縲�"
  (apply (lambda (s min h d mon y &rest rest)
           (format-time-string "%Y-%m-%d.txt"
                               (encode-time s min h (+ d i) mon y)))
         (if date
             (append '(0 0 0) date)
           (apply (lambda (s min h d mon y &rest rest)
                    (list s min (- h (or simple-hatena-time-offset 0)) d mon y))
                  (decode-time)))))

(defun simple-hatena-internal-go-for (i)
  "蠑墓焚縺ｮ謨ｰ縺�縺大燕蠕後����譌･莉倥����繝輔ぃ繧､蜷阪ヰ繝����ヵ繧｡縺ｸ遘ｻ蜍輔☆繧九��"
  (simple-hatena-internal-safe-find-file
   (concat
    (file-name-directory (buffer-file-name))
    (simple-hatena-internal-make-diary-file-string
     i
       (list (string-to-number simple-hatena-local-current-buffer-day)
             (string-to-number simple-hatena-local-current-buffer-month)
             (string-to-number simple-hatena-local-current-buffer-year))))))

(defun simple-hatena-internal-list-directories (dir)
  "dir荳九↓縺ゅｋ繝����ぅ繝ｬ繧ｯ繝医Μ繧偵Μ繧ｹ繝医↓縺励※霑斐☆縲�"
  (let ((dir-list nil))
    (dolist (file (directory-files dir t "^[^\.]") dir-list)
      (if (file-directory-p file)
          (progn
            (string-match "\\([^/]+\\)/?$" file)
            (setq dir-list (cons (match-string 1 file) dir-list)))))))

(defun simple-hatena-internal-completing-read-id (dir)
  "dir莉･荳九°繧峨����縺ｦ縺ｪid繧呈歓蜃ｺ縺励�∬｣懷ｮ悟����蜉帙＆縺帙ｋ縲�"
  (completing-read
   "Hatena id: " (simple-hatena-internal-list-directories simple-hatena-root) nil t))

(defun simple-hatena-internal-completing-read-group (id)
  "dir莉･荳九°繧峨げ繝ｫ繝ｼ繝怜錐繧呈歓蜃ｺ縺励�∬｣懷ｮ悟����蜉帙＆縺帙ｋ縲�"
  (completing-read
   "Group: " (simple-hatena-internal-list-directories
              (concat simple-hatena-root "/" id "/group")) nil t))

(defun simple-hatena-internal-do-submit (&optional flag)
  "縺ｯ縺ｦ縺ｪ繝�繧､繧｢繝ｪ/繧ｰ繝ｫ繝ｼ繝励∈譌･險倥ｒ謚慕ｨｿ縺吶ｋ縲�"
  (let ((max-mini-window-height 10)  ; hw.pl縺瑚｡ｨ遉ｺ縺吶ｋ繝｡繝����そ繝ｼ繧ｸ繧偵��
                                     ; echo繧ｨ繝ｪ繧｢縺ｫ陦ｨ遉ｺ縺輔○繧九◆繧√��
        (thisdir (file-name-directory (buffer-file-name))))
    (run-hooks 'simple-hatena-before-submit-hook)
    (when (buffer-modified-p)
      (save-buffer))
    (message "%s" "Now posting...")
    (let* ((buffer (get-buffer-create simple-hatena-process-buffer-name))
           (proc (get-buffer-process buffer)))
      (if (and
           proc
           (eq (process-status proc) 'run))
          (if (yes-or-no-p (format "A %s process is running; kill it?"
                                   (process-name proc)))
              (progn
                (interrupt-process proc)
                (sit-for 1)
                (delete-process proc))
            (error nil)))
      (with-current-buffer buffer
        (progn
          (erase-buffer)
          (buffer-disable-undo (current-buffer))
          (setq default-directory thisdir)))
      (make-comint-in-buffer
       "simple-hatena-submit" buffer shell-file-name nil
       shell-command-switch (simple-hatena-internal-build-command flag))
      (set-process-sentinel
       (get-buffer-process buffer)
       '(lambda (process signal)
          (if (string= signal "finished\n")
              (let ((max-mini-window-height 10))
                (display-message-or-buffer (process-buffer process))
                (run-hooks 'simple-hatena-after-submit-hook))))))))

(defun simple-hatena-internal-build-command (flag)
  "螳溯｡悟庄閭ｽ縺ｪ繧ｳ繝槭Φ繝画枚蟄怜����繧剃ｽ懈����縺吶ｋ縲�"
  (let ((flag-list (list flag)))
    (if simple-hatena-option-debug-flag  (setq flag-list (cons "-d" flag-list)))
    (if simple-hatena-option-cookie-flag (setq flag-list (cons "-c" flag-list)))
    (simple-hatena-internal-join
     " "
     (cons simple-hatena-bin
           (append (simple-hatena-internal-build-option-list-from-alist) flag-list)))))

(defun simple-hatena-internal-build-option-list-from-alist ()
  "蠑墓焚繧貞叙繧九が繝励す繝ｧ繝ｳ縺ｮ繝ｪ繧ｹ繝医ｒ菴懈����縺吶ｋ縲�"
  (let ((opts nil))
    (dolist (pair
             `(("-u" . ,simple-hatena-local-current-buffer-id)
               ("-g" . ,simple-hatena-local-current-buffer-group)
               ("-a" . ,simple-hatena-option-useragent)
               ("-T" . ,(format "%s" simple-hatena-option-timeout)))
             opts)
      (if (cdr pair)
           (setq opts (append opts (list (car pair) (cdr pair))))))))

(defun simple-hatena-internal-join (sep list)
  "霆願ｼｪ縺ｮ蜀咲匱譏弱↑繧薙□繧阪≧縺代←縲∬ｦ九▽縺九ｉ縺ｪ縺九▲縺溘����縺ｧjoin螳溯｣�"
  (if (<= (length list) 1)
      (car list)
    (concat (car list) sep (simple-hatena-internal-join sep (cdr list)))))

(defun simple-hatena-update-modeline ()
  "繝｢繝ｼ繝峨Λ繧､繝ｳ縺ｮ陦ｨ遉ｺ繧呈峩譁ｰ縺吶ｋ"
  (let ((id
         (concat
          (if simple-hatena-local-current-buffer-group
              (format "g:%s:" simple-hatena-local-current-buffer-group)
            "")
          (format "id:%s" simple-hatena-local-current-buffer-id))))
    (setq mode-name (format "Simple Hatena [%s]" id))
    (force-mode-line-update)))

(provide 'simple-hatena-mode)

;;; simple-hatena-mode.el ends here

;; Example Elpaca early-init.el -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

;; Tangle the file if needed
(let* ((default-directory user-emacs-directory)
       (org-file "init.org")
       (el-file "init.el"))
  (when (file-newer-than-file-p org-file el-file)
    (require 'ob-tangle)
    (org-babel-tangle-file org-file el-file "elisp\\|emacs-lisp")
    (dolist (feat features)
      (let ((sn (symbol-name feat)))
        (when (or (string-match-p "^\\(org\\|ob\\|ol\\|oc\\)-" sn)
                  (member sn '("ol" "oc" "orgstrap" "org")))
          (unload-feature feat t))))))

;; The texlab language server is broken without this!!!
(setenv "LSP_USE_PLISTS" "true")

;; Local Variables:
;; no-byte-compile: t
;; no-native-compile: t
;; no-update-autoloads: t
;; End:

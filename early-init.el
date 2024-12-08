;; Example Elpaca early-init.el -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)
   
;; Tangle the init file if needed
(let* ((org-file (expand-file-name "init.org" user-emacs-directory))
       (el-file (expand-file-name "init.el" user-emacs-directory)))
  (when (file-newer-than-file-p org-file el-file)
    (message "Org init file being tangled!")
    (require 'ob-tangle)
    (org-babel-tangle-file org-file el-file "elisp\\|emacs-lisp")
    (restart-emacs)))

;; The texlab language server is broken without this!!!
(setenv "LSP_USE_PLISTS" "true")

;; Local Variables:
;; no-byte-compile: t
;; no-native-compile: t
;; no-update-autoloads: t
;; End:

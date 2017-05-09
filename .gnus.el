;;; package --- Summary
;;; Commentary:
;;; Code:

(setq user-mail-address "xxx@xxx")
(setq user-full-name "Jonathan Conde")

(setq gnus-select-method '(nnnil ""))
(setq gnus-secondary-select-methods '((nnml "")
                                      (nnimap "mail.xxx.ch")))

(setq smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("mail.xxx.ch" 587 nil nil))
      smtpmail-auth-credentials '(("mail.xxx.ch" 587 "xxx@xxx" nil))
      smtpmail-default-smtp-server "mail.xxx.ch"
      smtpmail-smtp-server "mail.xxx.ch"
      smtpmail-smtp-service 587
      starttls-use-gnutls t)

;; Use fancy splitting:
(setq nnmail-split-methods 'nnmail-split-fancy)

;; Use topics per default:
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Show more MIME-stuff:
(setq gnus-mime-display-multipart-related-as-mixed t)

;; Smileys:
(setq smiley-style 'medium)

;; Don't get the first article automatically:
(setq gnus-auto-select-first nil)

;; Don't show that annoying arrow:
(setq gnus-summary-display-arrow nil)

;; Archive outgoing email in Sent folder on infomaniak.ch:
(setq gnus-message-archive-method '(nnimap "mail.xxx.ch")
      gnus-message-archive-group "Sent")

;; Mark gcc'ed (archived) as read:
(setq gnus-gcc-mark-as-read t)

;; Demon to fetch email every 5 minutes when Emacs has been idle for 5 minutes:
(gnus-demon-add-handler 'gnus-demon-scan-news 5 5)
(gnus-demon-init)

(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5))

(define-key gnus-group-mode-map
  ;; list all the subscribed groups even they contain zero un-read messages
  (kbd "o") 'my-gnus-group-list-subscribed-groups)

(provide '.gnus)
;;; .gnus ends here

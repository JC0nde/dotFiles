;; All config comes from http://koldfront.dk/text/gnus-email-tutorial.html

(setq gnus-select-method '(nnnil ""))
(setq gnus-secondary-select-methods '((nnml "")
                                      (nnimap "mail.infomaniak.ch")))

(setq smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

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
(setq gnus-message-archive-method '(nnimap "mail.infomaniak.ch")
      gnus-message-archive-group "Sent")

;; Mark gcc'ed (archived) as read:
(setq gnus-gcc-mark-as-read t)

;; Demon to fetch email every 5 minutes when Emacs has been idle for 5 minutes:
(gnus-demon-add-handler 'gnus-demon-scan-news 5 5)
(gnus-demon-init)

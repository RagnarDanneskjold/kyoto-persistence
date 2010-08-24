(in-package #:kyoto-persistence)

(defstruct (btree
	     (:predicate btree?))
  file db duplicates-allowed?)

(defun open-btree (file &key duplicates-allowed?)
  (make-btree :file file :db (open-store file) :duplicates-allowed? duplicates-allowed?))

(defun close-btree (btree)
  (close-store (btree-db btree)))

(defun set-btree (btree key value)
  (store-object (btree-db btree) key value))

(defun get-btree (btree key)
  (lookup-object (btree-db btree) key))

(defun rem-btree (btree key)
  (delete-object (db-btree btree) key))


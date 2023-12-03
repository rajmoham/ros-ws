
(cl:in-package :asdf)

(defsystem "second_coursework-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :second_coursework-msg
)
  :components ((:file "_package")
    (:file "MoveRobot" :depends-on ("_package_MoveRobot"))
    (:file "_package_MoveRobot" :depends-on ("_package"))
    (:file "YOLOLastFrame" :depends-on ("_package_YOLOLastFrame"))
    (:file "_package_YOLOLastFrame" :depends-on ("_package"))
  ))
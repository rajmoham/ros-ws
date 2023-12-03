
(cl:in-package :asdf)

(defsystem "second_coursework-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RoomCheckAction" :depends-on ("_package_RoomCheckAction"))
    (:file "_package_RoomCheckAction" :depends-on ("_package"))
    (:file "RoomCheckActionFeedback" :depends-on ("_package_RoomCheckActionFeedback"))
    (:file "_package_RoomCheckActionFeedback" :depends-on ("_package"))
    (:file "RoomCheckActionGoal" :depends-on ("_package_RoomCheckActionGoal"))
    (:file "_package_RoomCheckActionGoal" :depends-on ("_package"))
    (:file "RoomCheckActionResult" :depends-on ("_package_RoomCheckActionResult"))
    (:file "_package_RoomCheckActionResult" :depends-on ("_package"))
    (:file "RoomCheckFeedback" :depends-on ("_package_RoomCheckFeedback"))
    (:file "_package_RoomCheckFeedback" :depends-on ("_package"))
    (:file "RoomCheckGoal" :depends-on ("_package_RoomCheckGoal"))
    (:file "_package_RoomCheckGoal" :depends-on ("_package"))
    (:file "RoomCheckResult" :depends-on ("_package_RoomCheckResult"))
    (:file "_package_RoomCheckResult" :depends-on ("_package"))
    (:file "YOLODetection" :depends-on ("_package_YOLODetection"))
    (:file "_package_YOLODetection" :depends-on ("_package"))
  ))
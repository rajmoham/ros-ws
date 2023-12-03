;; Auto-generated. Do not edit!


(when (boundp 'second_coursework::MoveRobot)
  (if (not (find-package "SECOND_COURSEWORK"))
    (make-package "SECOND_COURSEWORK"))
  (shadow 'MoveRobot (find-package "SECOND_COURSEWORK")))
(unless (find-package "SECOND_COURSEWORK::MOVEROBOT")
  (make-package "SECOND_COURSEWORK::MOVEROBOT"))
(unless (find-package "SECOND_COURSEWORK::MOVEROBOTREQUEST")
  (make-package "SECOND_COURSEWORK::MOVEROBOTREQUEST"))
(unless (find-package "SECOND_COURSEWORK::MOVEROBOTRESPONSE")
  (make-package "SECOND_COURSEWORK::MOVEROBOTRESPONSE"))

(in-package "ROS")





(defclass second_coursework::MoveRobotRequest
  :super ros::object
  :slots (_room ))

(defmethod second_coursework::MoveRobotRequest
  (:init
   (&key
    ((:room __room) "")
    )
   (send-super :init)
   (setq _room (string __room))
   self)
  (:room
   (&optional __room)
   (if __room (setq _room __room)) _room)
  (:serialization-length
   ()
   (+
    ;; string _room
    4 (length _room)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _room
       (write-long (length _room) s) (princ _room s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _room
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _room (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass second_coursework::MoveRobotResponse
  :super ros::object
  :slots (_has_reached ))

(defmethod second_coursework::MoveRobotResponse
  (:init
   (&key
    ((:has_reached __has_reached) nil)
    )
   (send-super :init)
   (setq _has_reached __has_reached)
   self)
  (:has_reached
   (&optional (__has_reached :null))
   (if (not (eq __has_reached :null)) (setq _has_reached __has_reached)) _has_reached)
  (:serialization-length
   ()
   (+
    ;; bool _has_reached
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _has_reached
       (if _has_reached (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _has_reached
     (setq _has_reached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass second_coursework::MoveRobot
  :super ros::object
  :slots ())

(setf (get second_coursework::MoveRobot :md5sum-) "d7f6bc17ab9cca7adaad06bf5bcb21cf")
(setf (get second_coursework::MoveRobot :datatype-) "second_coursework/MoveRobot")
(setf (get second_coursework::MoveRobot :request) second_coursework::MoveRobotRequest)
(setf (get second_coursework::MoveRobot :response) second_coursework::MoveRobotResponse)

(defmethod second_coursework::MoveRobotRequest
  (:response () (instance second_coursework::MoveRobotResponse :init)))

(setf (get second_coursework::MoveRobotRequest :md5sum-) "d7f6bc17ab9cca7adaad06bf5bcb21cf")
(setf (get second_coursework::MoveRobotRequest :datatype-) "second_coursework/MoveRobotRequest")
(setf (get second_coursework::MoveRobotRequest :definition-)
      "string room
---
bool has_reached
")

(setf (get second_coursework::MoveRobotResponse :md5sum-) "d7f6bc17ab9cca7adaad06bf5bcb21cf")
(setf (get second_coursework::MoveRobotResponse :datatype-) "second_coursework/MoveRobotResponse")
(setf (get second_coursework::MoveRobotResponse :definition-)
      "string room
---
bool has_reached
")



(provide :second_coursework/MoveRobot "d7f6bc17ab9cca7adaad06bf5bcb21cf")



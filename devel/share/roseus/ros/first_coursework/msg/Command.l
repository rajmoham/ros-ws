;; Auto-generated. Do not edit!


(when (boundp 'first_coursework::Command)
  (if (not (find-package "FIRST_COURSEWORK"))
    (make-package "FIRST_COURSEWORK"))
  (shadow 'Command (find-package "FIRST_COURSEWORK")))
(unless (find-package "FIRST_COURSEWORK::COMMAND")
  (make-package "FIRST_COURSEWORK::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude Command.msg.html


(defclass first_coursework::Command
  :super ros::object
  :slots (_command _value ))

(defmethod first_coursework::Command
  (:init
   (&key
    ((:command __command) "")
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _value (round __value))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get first_coursework::Command :md5sum-) "d0fd248dabc91b444e51e6324afe70ff")
(setf (get first_coursework::Command :datatype-) "first_coursework/Command")
(setf (get first_coursework::Command :definition-)
      "string command
int32 value
")



(provide :first_coursework/Command "d0fd248dabc91b444e51e6324afe70ff")



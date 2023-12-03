;; Auto-generated. Do not edit!


(when (boundp 'my_msgs::MyMessage)
  (if (not (find-package "MY_MSGS"))
    (make-package "MY_MSGS"))
  (shadow 'MyMessage (find-package "MY_MSGS")))
(unless (find-package "MY_MSGS::MYMESSAGE")
  (make-package "MY_MSGS::MYMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude MyMessage.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass my_msgs::MyMessage
  :super ros::object
  :slots (_name _speed ))

(defmethod my_msgs::MyMessage
  (:init
   (&key
    ((:name __name) "")
    ((:speed __speed) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _speed __speed)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:speed
   (&rest __speed)
   (if (keywordp (car __speed))
       (send* _speed __speed)
     (progn
       (if __speed (setq _speed (car __speed)))
       _speed)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Twist _speed
    (send _speed :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Twist _speed
       (send _speed :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Twist _speed
     (send _speed :deserialize buf ptr-) (incf ptr- (send _speed :serialization-length))
   ;;
   self)
  )

(setf (get my_msgs::MyMessage :md5sum-) "32ea5828af2249da22c265cc624575db")
(setf (get my_msgs::MyMessage :datatype-) "my_msgs/MyMessage")
(setf (get my_msgs::MyMessage :definition-)
      "string name
geometry_msgs/Twist speed
================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :my_msgs/MyMessage "32ea5828af2249da22c265cc624575db")



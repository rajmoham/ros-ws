; Auto-generated. Do not edit!


(cl:in-package second_coursework-msg)


;//! \htmlinclude RoomCheckResult.msg.html

(cl:defclass <RoomCheckResult> (roslisp-msg-protocol:ros-message)
  ((rule_break_count
    :reader rule_break_count
    :initarg :rule_break_count
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass RoomCheckResult (<RoomCheckResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RoomCheckResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RoomCheckResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name second_coursework-msg:<RoomCheckResult> is deprecated: use second_coursework-msg:RoomCheckResult instead.")))

(cl:ensure-generic-function 'rule_break_count-val :lambda-list '(m))
(cl:defmethod rule_break_count-val ((m <RoomCheckResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader second_coursework-msg:rule_break_count-val is deprecated.  Use second_coursework-msg:rule_break_count instead.")
  (rule_break_count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RoomCheckResult>) ostream)
  "Serializes a message object of type '<RoomCheckResult>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rule_break_count))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'rule_break_count))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RoomCheckResult>) istream)
  "Deserializes a message object of type '<RoomCheckResult>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rule_break_count) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rule_break_count)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RoomCheckResult>)))
  "Returns string type for a message object of type '<RoomCheckResult>"
  "second_coursework/RoomCheckResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RoomCheckResult)))
  "Returns string type for a message object of type 'RoomCheckResult"
  "second_coursework/RoomCheckResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RoomCheckResult>)))
  "Returns md5sum for a message object of type '<RoomCheckResult>"
  "1e2f74145994c14f07c573ef71b90ff4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RoomCheckResult)))
  "Returns md5sum for a message object of type 'RoomCheckResult"
  "1e2f74145994c14f07c573ef71b90ff4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RoomCheckResult>)))
  "Returns full string definition for message of type '<RoomCheckResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#Define result~%int32[] rule_break_count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RoomCheckResult)))
  "Returns full string definition for message of type 'RoomCheckResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#Define result~%int32[] rule_break_count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RoomCheckResult>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rule_break_count) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RoomCheckResult>))
  "Converts a ROS message object to a list"
  (cl:list 'RoomCheckResult
    (cl:cons ':rule_break_count (rule_break_count msg))
))

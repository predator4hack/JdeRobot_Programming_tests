; Auto-generated. Do not edit!


(cl:in-package ros2_is_fun-msg)


;//! \htmlinclude my_message.msg.html

(cl:defclass <my_message> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass my_message (<my_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros2_is_fun-msg:<my_message> is deprecated: use ros2_is_fun-msg:my_message instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <my_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros2_is_fun-msg:message-val is deprecated.  Use ros2_is_fun-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_message>) ostream)
  "Serializes a message object of type '<my_message>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_message>) istream)
  "Deserializes a message object of type '<my_message>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_message>)))
  "Returns string type for a message object of type '<my_message>"
  "ros2_is_fun/my_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_message)))
  "Returns string type for a message object of type 'my_message"
  "ros2_is_fun/my_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_message>)))
  "Returns md5sum for a message object of type '<my_message>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_message)))
  "Returns md5sum for a message object of type 'my_message"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_message>)))
  "Returns full string definition for message of type '<my_message>"
  (cl:format cl:nil "string message~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_message)))
  "Returns full string definition for message of type 'my_message"
  (cl:format cl:nil "string message~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_message>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_message>))
  "Converts a ROS message object to a list"
  (cl:list 'my_message
    (cl:cons ':message (message msg))
))

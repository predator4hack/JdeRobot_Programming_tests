;; Auto-generated. Do not edit!


(when (boundp 'ros2_is_fun::my_message)
  (if (not (find-package "ROS2_IS_FUN"))
    (make-package "ROS2_IS_FUN"))
  (shadow 'my_message (find-package "ROS2_IS_FUN")))
(unless (find-package "ROS2_IS_FUN::MY_MESSAGE")
  (make-package "ROS2_IS_FUN::MY_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude my_message.msg.html


(defclass ros2_is_fun::my_message
  :super ros::object
  :slots (_message ))

(defmethod ros2_is_fun::my_message
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ros2_is_fun::my_message :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get ros2_is_fun::my_message :datatype-) "ros2_is_fun/my_message")
(setf (get ros2_is_fun::my_message :definition-)
      "string message
")



(provide :ros2_is_fun/my_message "5f003d6bcc824cbd51361d66d8e4f76c")



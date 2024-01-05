; Auto-generated. Do not edit!


(cl:in-package robotiq_2f_gripper_control-srv)


;//! \htmlinclude UnityGripper-request.msg.html

(cl:defclass <UnityGripper-request> (roslisp-msg-protocol:ros-message)
  ((open_close
    :reader open_close
    :initarg :open_close
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass UnityGripper-request (<UnityGripper-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UnityGripper-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UnityGripper-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_2f_gripper_control-srv:<UnityGripper-request> is deprecated: use robotiq_2f_gripper_control-srv:UnityGripper-request instead.")))

(cl:ensure-generic-function 'open_close-val :lambda-list '(m))
(cl:defmethod open_close-val ((m <UnityGripper-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_2f_gripper_control-srv:open_close-val is deprecated.  Use robotiq_2f_gripper_control-srv:open_close instead.")
  (open_close m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UnityGripper-request>) ostream)
  "Serializes a message object of type '<UnityGripper-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'open_close) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UnityGripper-request>) istream)
  "Deserializes a message object of type '<UnityGripper-request>"
    (cl:setf (cl:slot-value msg 'open_close) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UnityGripper-request>)))
  "Returns string type for a service object of type '<UnityGripper-request>"
  "robotiq_2f_gripper_control/UnityGripperRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UnityGripper-request)))
  "Returns string type for a service object of type 'UnityGripper-request"
  "robotiq_2f_gripper_control/UnityGripperRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UnityGripper-request>)))
  "Returns md5sum for a message object of type '<UnityGripper-request>"
  "b8f9390b552cf214da09ba18942db4b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UnityGripper-request)))
  "Returns md5sum for a message object of type 'UnityGripper-request"
  "b8f9390b552cf214da09ba18942db4b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UnityGripper-request>)))
  "Returns full string definition for message of type '<UnityGripper-request>"
  (cl:format cl:nil "bool open_close #open 0 close 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UnityGripper-request)))
  "Returns full string definition for message of type 'UnityGripper-request"
  (cl:format cl:nil "bool open_close #open 0 close 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UnityGripper-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UnityGripper-request>))
  "Converts a ROS message object to a list"
  (cl:list 'UnityGripper-request
    (cl:cons ':open_close (open_close msg))
))
;//! \htmlinclude UnityGripper-response.msg.html

(cl:defclass <UnityGripper-response> (roslisp-msg-protocol:ros-message)
  ((gripper_state
    :reader gripper_state
    :initarg :gripper_state
    :type cl:string
    :initform ""))
)

(cl:defclass UnityGripper-response (<UnityGripper-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UnityGripper-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UnityGripper-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_2f_gripper_control-srv:<UnityGripper-response> is deprecated: use robotiq_2f_gripper_control-srv:UnityGripper-response instead.")))

(cl:ensure-generic-function 'gripper_state-val :lambda-list '(m))
(cl:defmethod gripper_state-val ((m <UnityGripper-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_2f_gripper_control-srv:gripper_state-val is deprecated.  Use robotiq_2f_gripper_control-srv:gripper_state instead.")
  (gripper_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UnityGripper-response>) ostream)
  "Serializes a message object of type '<UnityGripper-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gripper_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gripper_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UnityGripper-response>) istream)
  "Deserializes a message object of type '<UnityGripper-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gripper_state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gripper_state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UnityGripper-response>)))
  "Returns string type for a service object of type '<UnityGripper-response>"
  "robotiq_2f_gripper_control/UnityGripperResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UnityGripper-response)))
  "Returns string type for a service object of type 'UnityGripper-response"
  "robotiq_2f_gripper_control/UnityGripperResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UnityGripper-response>)))
  "Returns md5sum for a message object of type '<UnityGripper-response>"
  "b8f9390b552cf214da09ba18942db4b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UnityGripper-response)))
  "Returns md5sum for a message object of type 'UnityGripper-response"
  "b8f9390b552cf214da09ba18942db4b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UnityGripper-response>)))
  "Returns full string definition for message of type '<UnityGripper-response>"
  (cl:format cl:nil "string gripper_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UnityGripper-response)))
  "Returns full string definition for message of type 'UnityGripper-response"
  (cl:format cl:nil "string gripper_state~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UnityGripper-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'gripper_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UnityGripper-response>))
  "Converts a ROS message object to a list"
  (cl:list 'UnityGripper-response
    (cl:cons ':gripper_state (gripper_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'UnityGripper)))
  'UnityGripper-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'UnityGripper)))
  'UnityGripper-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UnityGripper)))
  "Returns string type for a service object of type '<UnityGripper>"
  "robotiq_2f_gripper_control/UnityGripper")
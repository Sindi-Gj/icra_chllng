;; Auto-generated. Do not edit!


(when (boundp 'robotiq_2f_gripper_control::UnityGripper)
  (if (not (find-package "ROBOTIQ_2F_GRIPPER_CONTROL"))
    (make-package "ROBOTIQ_2F_GRIPPER_CONTROL"))
  (shadow 'UnityGripper (find-package "ROBOTIQ_2F_GRIPPER_CONTROL")))
(unless (find-package "ROBOTIQ_2F_GRIPPER_CONTROL::UNITYGRIPPER")
  (make-package "ROBOTIQ_2F_GRIPPER_CONTROL::UNITYGRIPPER"))
(unless (find-package "ROBOTIQ_2F_GRIPPER_CONTROL::UNITYGRIPPERREQUEST")
  (make-package "ROBOTIQ_2F_GRIPPER_CONTROL::UNITYGRIPPERREQUEST"))
(unless (find-package "ROBOTIQ_2F_GRIPPER_CONTROL::UNITYGRIPPERRESPONSE")
  (make-package "ROBOTIQ_2F_GRIPPER_CONTROL::UNITYGRIPPERRESPONSE"))

(in-package "ROS")





(defclass robotiq_2f_gripper_control::UnityGripperRequest
  :super ros::object
  :slots (_open_close ))

(defmethod robotiq_2f_gripper_control::UnityGripperRequest
  (:init
   (&key
    ((:open_close __open_close) nil)
    )
   (send-super :init)
   (setq _open_close __open_close)
   self)
  (:open_close
   (&optional __open_close)
   (if __open_close (setq _open_close __open_close)) _open_close)
  (:serialization-length
   ()
   (+
    ;; bool _open_close
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _open_close
       (if _open_close (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _open_close
     (setq _open_close (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_2f_gripper_control::UnityGripperResponse
  :super ros::object
  :slots (_gripper_state ))

(defmethod robotiq_2f_gripper_control::UnityGripperResponse
  (:init
   (&key
    ((:gripper_state __gripper_state) "")
    )
   (send-super :init)
   (setq _gripper_state (string __gripper_state))
   self)
  (:gripper_state
   (&optional __gripper_state)
   (if __gripper_state (setq _gripper_state __gripper_state)) _gripper_state)
  (:serialization-length
   ()
   (+
    ;; string _gripper_state
    4 (length _gripper_state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _gripper_state
       (write-long (length _gripper_state) s) (princ _gripper_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _gripper_state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _gripper_state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robotiq_2f_gripper_control::UnityGripper
  :super ros::object
  :slots ())

(setf (get robotiq_2f_gripper_control::UnityGripper :md5sum-) "b8f9390b552cf214da09ba18942db4b9")
(setf (get robotiq_2f_gripper_control::UnityGripper :datatype-) "robotiq_2f_gripper_control/UnityGripper")
(setf (get robotiq_2f_gripper_control::UnityGripper :request) robotiq_2f_gripper_control::UnityGripperRequest)
(setf (get robotiq_2f_gripper_control::UnityGripper :response) robotiq_2f_gripper_control::UnityGripperResponse)

(defmethod robotiq_2f_gripper_control::UnityGripperRequest
  (:response () (instance robotiq_2f_gripper_control::UnityGripperResponse :init)))

(setf (get robotiq_2f_gripper_control::UnityGripperRequest :md5sum-) "b8f9390b552cf214da09ba18942db4b9")
(setf (get robotiq_2f_gripper_control::UnityGripperRequest :datatype-) "robotiq_2f_gripper_control/UnityGripperRequest")
(setf (get robotiq_2f_gripper_control::UnityGripperRequest :definition-)
      "bool open_close #open 0 close 1
---
string gripper_state

")

(setf (get robotiq_2f_gripper_control::UnityGripperResponse :md5sum-) "b8f9390b552cf214da09ba18942db4b9")
(setf (get robotiq_2f_gripper_control::UnityGripperResponse :datatype-) "robotiq_2f_gripper_control/UnityGripperResponse")
(setf (get robotiq_2f_gripper_control::UnityGripperResponse :definition-)
      "bool open_close #open 0 close 1
---
string gripper_state

")



(provide :robotiq_2f_gripper_control/UnityGripper "b8f9390b552cf214da09ba18942db4b9")



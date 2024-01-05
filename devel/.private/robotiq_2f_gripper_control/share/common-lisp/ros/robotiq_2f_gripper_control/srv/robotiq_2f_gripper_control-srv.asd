
(cl:in-package :asdf)

(defsystem "robotiq_2f_gripper_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "UnityGripper" :depends-on ("_package_UnityGripper"))
    (:file "_package_UnityGripper" :depends-on ("_package"))
  ))
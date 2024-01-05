#!/usr/bin/env python
####################################################################################
# Demo for ICRA challenge
# This demo will be run at 75% override
# The code has been simplified for clarity and is therefore not the optimal solution
####################################################################################
from math import radians
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
import sys
import copy
from robotiq_2f_gripper_control.msg import _Robotiq2FGripper_robot_output  as outputMsg
import sys

# Initialising the publisher which will control the robotiq gripper
pub = rospy.Publisher('Robotiq2FGripperRobotOutput', outputMsg.Robotiq2FGripper_robot_output, queue_size=10)

# Initilasing the ROS node
moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('test_gripper')

robot = moveit_commander.RobotCommander()

#scene = moveit_commander.PlanningSceneInterface()


group_name = "manipulator"
group = moveit_commander.MoveGroupCommander(group_name)


rospy.loginfo("Waiting 2 seconds for intial setup...")
rospy.sleep(2)
rospy.loginfo("Ready to go!")
# Initialising the command msg to be sent to the gripper
command = outputMsg.Robotiq2FGripper_robot_output()
command.rACT = 1
command.rGTO = 1
command.rATR = 0
command.rPR = rospy.get_param('val',0) # only value you will change to open/close the gripper
command.rSP = 255
command.rFR = 150
group.clear_pose_targets()
pose_goal = group.get_current_pose().pose
pose_goal.position.x = -0.348
pose_goal.position.y = -0.602
pose_goal.position.z = 0.40	
pose_goal.orientation.x = 0.672
pose_goal.orientation.y = 0.741
pose_goal.orientation.z = 0.0
pose_goal.orientation.w = 0.0

group.set_pose_target(pose_goal)
rospy.loginfo("Overhead")
plan = group.plan()
rospy.sleep(2)
group.execute(plan, wait=True)
rospy.sleep(5)
pose_goal.position.z = 0.18	
rospy.loginfo("Cube")
group.set_pose_target(pose_goal)
plan = group.plan()
group.execute(plan, wait=True)
rospy.sleep(2)
group.clear_pose_targets()


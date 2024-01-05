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
from geometry_msgs.msg import Pose
import visualization_msgs.msg
import shape_msgs.msg
import std_msgs.msg
import sensor_msgs.msg
import numpy as np

counter = 0
COLOR_TRANSLUCENT = std_msgs.msg.ColorRGBA(0.0, 0.0, 0.0, 0.5)
COLOR_GREEN = std_msgs.msg.ColorRGBA(0.0, 1.0, 0.0, 1.0)
def create_start_state():
    # Now create a robot state from these joint positions
    joint_state = sensor_msgs.msg.JointState()
    joint_state.header.stamp = rospy.Time.now()
    joint_state.header.frame_id = group.get_pose_reference_frame()
    joint_state.name = ["iiwa_joint_1","iiwa_joint_2","iiwa_joint_3","iiwa_joint_4","iiwa_joint_5","iiwa_joint_6","iiwa_joint_7"]
    joint_state.position = [radians(4.45),radians(9.84),radians(-4.62),radians(-71.41),radians(1.79),radians(94.58),radians(-74.26),]

    state = moveit_msgs.msg.RobotState()
    state.joint_state = joint_state

    return state

def create_pick_state():
    # Now create a robot state from these joint positions
    joint_state = sensor_msgs.msg.JointState()
    joint_state.header.stamp = rospy.Time.now()
    joint_state.header.frame_id = group.get_pose_reference_frame()
    joint_state.name = ["iiwa_joint_1","iiwa_joint_2","iiwa_joint_3","iiwa_joint_4","iiwa_joint_5","iiwa_joint_6","iiwa_joint_7"]
    joint_state.position = [radians(39.8),radians(49.56),radians(11.49),radians(-51.73),radians(-8.81),radians(79.39),radians(-31.7),]

    state = moveit_msgs.msg.RobotState()
    state.joint_state = joint_state

    return state


def gripper_move(opening=True):
    raw_input("Press to continue gripper")
    command = outputMsg.Robotiq2FGripper_robot_output()
    command.rACT = 1
    command.rGTO = 1
    command.rATR = 0
    command.rPR = 0 if opening else 200
    command.rSP = 255
    command.rFR = 150
    pub.publish(command)


def gripper_open():
    gripper_move()

def gripper_close():
    gripper_move(False)


def generate_waypoints(start, stop, axis, step=10):
    s, e = 0 ,0

    waypoints = []
    
    s = start.position.x
    e = stop.position.x
    xl = np.linspace(s, e, step)

    s = start.position.y
    e = stop.position.y
    yl = np.linspace(s, e, step)

    s = start.position.z
    e = stop.position.z
    zl = np.linspace(s, e, step)

    for i in range(1, 10) :
        new_pose = copy.deepcopy(stop)
        new_pose.position.x = xl[i]
        new_pose.position.y = yl[i]
        new_pose.position.z = zl[i]
        waypoints.append(new_pose)
    return waypoints

def move_cartesian(pose, axis="z"):
    display_sphere(pose)
    raw_input("Press to continue")
    waypoints = generate_waypoints(group.get_current_pose().pose, pose, axis)
    (plan, fraction) = group.compute_cartesian_path(
    waypoints, 0.01, 0.0, avoid_collisions = False # waypoints to follow  # eef_step
    )  # jump_threshold
    rospy.sleep(2)
    group.execute(plan, wait=True)
    group.stop()
    group.clear_pose_targets()

def move(pose):
    display_sphere(pose)
    raw_input("Press to continue")
    group.set_pose_target(pose)
    group.set_planning_time(20)
    group.set_num_planning_attempts(20)
    rospy.sleep(2)
    plan = group.plan()
    rospy.sleep(2)
    group.execute(plan, wait=True)
    group.stop()
    group.clear_pose_targets()

def pick(pose):
    rospy.loginfo("Aproaching")
    
    pose.position.z += 0.25
    move_cartesian(pose)
    rospy.loginfo("Descending")
    
    pose.position.z -= 0.25
    move_cartesian(pose, "z")

    rospy.loginfo("Gripping")
    gripper_close()
    rospy.loginfo("Retreating")
    pose.position.z += 0.25
    move_cartesian(pose, "z")
    # remove offset
    pose.position.z -= 0.25

def place(pose):
    rospy.loginfo("Aproaching")
    pose.position.z += 0.25
    move_cartesian(pose)
    rospy.loginfo("Descending")
    pose.position.z -= 0.25
    move_cartesian(pose, "z")
    rospy.loginfo("Opening")
    gripper_open()
    rospy.loginfo("Retreating")
    pose.position.z += 0.25
    move_cartesian(pose, "z")

def pick_place(start, stop):
    rospy.loginfo("Picking")
    pick(start)
    rospy.loginfo("Placing")
    place(stop)

def display_box(pose, dimensions):
    global counter
    # setup cube / box marker type
    marker = visualization_msgs.msg.Marker()
    marker.header.stamp = rospy.Time.now()
    marker.ns = "/"
    counter += 1
    marker.id = counter
    marker.type = visualization_msgs.msg.Marker.CUBE
    marker.action = visualization_msgs.msg.Marker.ADD
    marker.color = COLOR_TRANSLUCENT
    marker.header.frame_id = group.get_pose_reference_frame()

    # fill in user input
    marker.pose = pose
    marker.scale.x = dimensions[0]
    marker.scale.y = dimensions[1]
    marker.scale.z = dimensions[2]

    # publish it!
    marker_publisher.publish(marker)

def create_vertical_plane_constraints(box = [1, 1, 1.0]):
    pcm = moveit_msgs.msg.PositionConstraint()
    pcm.header.frame_id = group.get_pose_reference_frame()
    pcm.link_name = group.get_end_effector_link()

    rospy.loginfo(pcm.header.frame_id)
    rospy.loginfo(pcm.link_name)
    cbox = shape_msgs.msg.SolidPrimitive()
    cbox.type = shape_msgs.msg.SolidPrimitive.BOX
    cbox.dimensions = box
    pcm.constraint_region.primitives.append(cbox)

    current_pose = group.get_current_pose()

    cbox_pose = geometry_msgs.msg.Pose()
    cbox_pose.position.x = current_pose.pose.position.x
    cbox_pose.position.y = current_pose.pose.position.y
    cbox_pose.position.z = current_pose.pose.position.z

    cbox_pose.orientation.w = 1.0
    pcm.constraint_region.primitive_poses.append(cbox_pose)

    # display the constraints in rviz
    display_box(cbox_pose, cbox.dimensions)

    return pcm


def display_sphere(pose, radius=0.05, color=COLOR_GREEN):
    """ Utility function to visualize the goal pose"""
    global counter
    counter += 1
    # setup sphere marker type
    marker = visualization_msgs.msg.Marker()
    marker.header.stamp = rospy.Time.now()
    marker.ns = "/"
    marker.id = 0
    marker.type = visualization_msgs.msg.Marker.SPHERE
    marker.action = visualization_msgs.msg.Marker.ADD
    marker.header.frame_id = group.get_pose_reference_frame()

    # fill in user input
    marker.color = color
    marker.pose = pose
    marker.scale.x = radius
    marker.scale.y = radius
    marker.scale.z = radius

    # publish it!
    marker_publisher.publish(marker)

# Initialising the publisher which will control the robotiq gripper

# Initilasing the ROS node
moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('test_gripper')

robot = moveit_commander.RobotCommander()
scene = moveit_commander.PlanningSceneInterface()
group_name = "manipulator"
group = moveit_commander.MoveGroupCommander(group_name)
marker_publisher = rospy.Publisher(
            "/visualization_marker", visualization_msgs.msg.Marker, queue_size=20,
        )
pub = rospy.Publisher('Robotiq2FGripperRobotOutput', outputMsg.Robotiq2FGripper_robot_output, queue_size=10)

rospy.loginfo("Waiting 2 seconds for intial setup...")
rospy.sleep(2)
rospy.loginfo("Ready to go!")

joint_goal = group.get_current_joint_values()
# Now we generate the joint goal by expressing the desired position of each joint
joint_goal[0] = radians(4.45)
joint_goal[1] = radians(9.84)
joint_goal[2] = radians(-4.62)
joint_goal[3] = radians(-71.41)
joint_goal[4] = radians(1.79)
joint_goal[5] = radians(94.58)
joint_goal[6] = radians(-74.26)
# And finally we move the robot
rospy.loginfo("Move to initial Position")
#group.go(joint_goal, wait=True)

start_pose = group.get_current_pose().pose
start_pose.position.x = -0.350
start_pose.position.y = -0.602
start_pose.position.z = 0.19	# 0.18
start_pose.orientation.x = 0.672
start_pose.orientation.y = 0.741
start_pose.orientation.z = 0.0
start_pose.orientation.w = 0.0

end_pose_1 = Pose()
end_pose_1.position.x = -0.566
end_pose_1.position.y = -0.151
end_pose_1.position.z = 0.28	
end_pose_1.orientation.x = 0.707
end_pose_1.orientation.y = 0.707
end_pose_1.orientation.z = 0.0
end_pose_1.orientation.w = 0.0

end_pose_2 = Pose()
end_pose_2.position.x = -0.683
end_pose_2.position.y = -0.151
end_pose_2.position.z = 0.28	
end_pose_2.orientation.x = 0.707
end_pose_2.orientation.y = 0.707
end_pose_2.orientation.z = 0.0
end_pose_2.orientation.w = 0.0

end_pose_3 = Pose()
end_pose_3.position.x = -0.635
end_pose_3.position.y = -0.100
end_pose_3.position.z = 0.33	
end_pose_3.orientation.x = 0.0
end_pose_3.orientation.y = 1.0
end_pose_3.orientation.z = 0.0
end_pose_3.orientation.w = 0.0

end_pose_4 = Pose()
end_pose_4.position.x = -0.635
end_pose_4.position.y = -0.212
end_pose_4.position.z = 0.33	
end_pose_4.orientation.x = 0.0
end_pose_4.orientation.y = 1.0
end_pose_4.orientation.z = 0.0
end_pose_4.orientation.w = 0.0


gripper_open()
current_level = 2
for i in [end_pose_1, end_pose_2, end_pose_3, end_pose_4]:
    i.position.z += 0.050 * 2 * current_level
    pick_place(start_pose, i)

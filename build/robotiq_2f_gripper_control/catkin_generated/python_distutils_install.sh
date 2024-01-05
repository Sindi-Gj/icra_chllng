#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mahdi/mrc_icra_ws/src/robotiq/robotiq_2f_gripper_control"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mahdi/mrc_icra_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mahdi/mrc_icra_ws/install/lib/python2.7/dist-packages:/home/mahdi/mrc_icra_ws/build/robotiq_2f_gripper_control/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mahdi/mrc_icra_ws/build/robotiq_2f_gripper_control" \
    "/usr/bin/python2" \
    "/home/mahdi/mrc_icra_ws/src/robotiq/robotiq_2f_gripper_control/setup.py" \
     \
    build --build-base "/home/mahdi/mrc_icra_ws/build/robotiq_2f_gripper_control" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/mahdi/mrc_icra_ws/install" --install-scripts="/home/mahdi/mrc_icra_ws/install/bin"

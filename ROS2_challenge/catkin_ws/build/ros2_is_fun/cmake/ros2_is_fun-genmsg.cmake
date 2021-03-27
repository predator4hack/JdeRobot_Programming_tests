# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ros2_is_fun: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iros2_is_fun:/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ros2_is_fun_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" NAME_WE)
add_custom_target(_ros2_is_fun_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ros2_is_fun" "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ros2_is_fun
  "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros2_is_fun
)

### Generating Services

### Generating Module File
_generate_module_cpp(ros2_is_fun
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros2_is_fun
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ros2_is_fun_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ros2_is_fun_generate_messages ros2_is_fun_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" NAME_WE)
add_dependencies(ros2_is_fun_generate_messages_cpp _ros2_is_fun_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros2_is_fun_gencpp)
add_dependencies(ros2_is_fun_gencpp ros2_is_fun_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros2_is_fun_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ros2_is_fun
  "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros2_is_fun
)

### Generating Services

### Generating Module File
_generate_module_eus(ros2_is_fun
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros2_is_fun
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ros2_is_fun_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ros2_is_fun_generate_messages ros2_is_fun_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" NAME_WE)
add_dependencies(ros2_is_fun_generate_messages_eus _ros2_is_fun_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros2_is_fun_geneus)
add_dependencies(ros2_is_fun_geneus ros2_is_fun_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros2_is_fun_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ros2_is_fun
  "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros2_is_fun
)

### Generating Services

### Generating Module File
_generate_module_lisp(ros2_is_fun
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros2_is_fun
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ros2_is_fun_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ros2_is_fun_generate_messages ros2_is_fun_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" NAME_WE)
add_dependencies(ros2_is_fun_generate_messages_lisp _ros2_is_fun_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros2_is_fun_genlisp)
add_dependencies(ros2_is_fun_genlisp ros2_is_fun_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros2_is_fun_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ros2_is_fun
  "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros2_is_fun
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ros2_is_fun
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros2_is_fun
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ros2_is_fun_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ros2_is_fun_generate_messages ros2_is_fun_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" NAME_WE)
add_dependencies(ros2_is_fun_generate_messages_nodejs _ros2_is_fun_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros2_is_fun_gennodejs)
add_dependencies(ros2_is_fun_gennodejs ros2_is_fun_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros2_is_fun_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ros2_is_fun
  "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros2_is_fun
)

### Generating Services

### Generating Module File
_generate_module_py(ros2_is_fun
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros2_is_fun
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ros2_is_fun_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ros2_is_fun_generate_messages ros2_is_fun_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chandan/JdeRobotGSOC_2021/ROS2_challenge/catkin_ws/src/ros2_is_fun/msg/my_message.msg" NAME_WE)
add_dependencies(ros2_is_fun_generate_messages_py _ros2_is_fun_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ros2_is_fun_genpy)
add_dependencies(ros2_is_fun_genpy ros2_is_fun_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ros2_is_fun_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros2_is_fun)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ros2_is_fun
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ros2_is_fun_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros2_is_fun)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ros2_is_fun
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ros2_is_fun_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros2_is_fun)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ros2_is_fun
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ros2_is_fun_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros2_is_fun)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ros2_is_fun
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ros2_is_fun_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros2_is_fun)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros2_is_fun\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ros2_is_fun
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ros2_is_fun_generate_messages_py std_msgs_generate_messages_py)
endif()

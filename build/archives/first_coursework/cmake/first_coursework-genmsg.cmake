# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "first_coursework: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ifirst_coursework:/home/rm/ros_ws/src/archives/first_coursework/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(first_coursework_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" NAME_WE)
add_custom_target(_first_coursework_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "first_coursework" "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(first_coursework
  "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_coursework
)

### Generating Services

### Generating Module File
_generate_module_cpp(first_coursework
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_coursework
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(first_coursework_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(first_coursework_generate_messages first_coursework_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" NAME_WE)
add_dependencies(first_coursework_generate_messages_cpp _first_coursework_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_coursework_gencpp)
add_dependencies(first_coursework_gencpp first_coursework_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_coursework_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(first_coursework
  "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_coursework
)

### Generating Services

### Generating Module File
_generate_module_eus(first_coursework
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_coursework
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(first_coursework_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(first_coursework_generate_messages first_coursework_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" NAME_WE)
add_dependencies(first_coursework_generate_messages_eus _first_coursework_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_coursework_geneus)
add_dependencies(first_coursework_geneus first_coursework_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_coursework_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(first_coursework
  "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_coursework
)

### Generating Services

### Generating Module File
_generate_module_lisp(first_coursework
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_coursework
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(first_coursework_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(first_coursework_generate_messages first_coursework_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" NAME_WE)
add_dependencies(first_coursework_generate_messages_lisp _first_coursework_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_coursework_genlisp)
add_dependencies(first_coursework_genlisp first_coursework_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_coursework_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(first_coursework
  "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_coursework
)

### Generating Services

### Generating Module File
_generate_module_nodejs(first_coursework
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_coursework
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(first_coursework_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(first_coursework_generate_messages first_coursework_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" NAME_WE)
add_dependencies(first_coursework_generate_messages_nodejs _first_coursework_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_coursework_gennodejs)
add_dependencies(first_coursework_gennodejs first_coursework_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_coursework_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(first_coursework
  "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_coursework
)

### Generating Services

### Generating Module File
_generate_module_py(first_coursework
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_coursework
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(first_coursework_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(first_coursework_generate_messages first_coursework_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rm/ros_ws/src/archives/first_coursework/msg/Command.msg" NAME_WE)
add_dependencies(first_coursework_generate_messages_py _first_coursework_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_coursework_genpy)
add_dependencies(first_coursework_genpy first_coursework_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_coursework_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_coursework)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_coursework
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(first_coursework_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_coursework)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_coursework
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(first_coursework_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_coursework)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_coursework
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(first_coursework_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_coursework)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_coursework
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(first_coursework_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_coursework)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_coursework\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_coursework
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(first_coursework_generate_messages_py geometry_msgs_generate_messages_py)
endif()

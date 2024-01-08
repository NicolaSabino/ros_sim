# Use the official ROS Melodic base image
FROM ros:melodic

ENV QT_SELECT=4
ENV DISPLAY=:0

# Install STDR simulator dependencies
RUN apt-get update && apt-get install -y \
    libyaml-cpp-dev \
    libxml2-dev \
    libtinyxml-dev \
    ros-melodic-tf \
    ros-melodic-tf2 \
    ros-melodic-tf2-ros \
    ros-melodic-map-server \
    ros-melodic-tf2-geometry-msgs \
    qt4-default \
    x11-apps \
    mesa-utils \
    && rm -rf /var/lib/apt/lists/*

# Set up ROS workspace
WORKDIR /catkin_ws/src
RUN git clone https://github.com/stdr-simulator-ros-pkg/stdr_simulator.git
WORKDIR /catkin_ws
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make"

# Set up entry point
CMD /bin/bash -c "source /catkin_ws/devel/setup.bash && roslaunch stdr_launchers server_with_map_and_gui_plus_robot.launch"

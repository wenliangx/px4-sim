ARG ROS_VERSION=noetic

FROM osrf/ros:${ROS_VERSION}-desktop-full

ARG ROS_VERSION

RUN apt-get update && apt-get install -y \
    wget \
    git \
    python3-pip \
    python3-tk \
    gcc-arm-none-eabi

WORKDIR /px4

ARG PX4_VERSION=main

RUN git clone --branch ${PX4_VERSION} --recurse-submodules --shallow-submodules --depth 1 https://github.com/PX4/PX4-Autopilot.git

RUN bash /px4/PX4-Autopilot/Tools/setup/ubuntu.sh

RUN apt-get install -y \
    ros-${ROS_VERSION}-mavros \
    ros-${ROS_VERSION}-mavros-extras \
    ros-${ROS_VERSION}-mavros-msgs
    
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh && \
    bash /px4/install_geographiclib_datasets.sh

RUN echo "source /opt/ros/${ROS_VERSION}/setup.bash" >> /root/.bashrc

WORKDIR /workspace

CMD [ "bash" ]
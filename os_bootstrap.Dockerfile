FROM fedora:latest

ARG USERNAME=ansible_user
ARG USER_UID=1000
ARG GROUP_GID=1000

RUN groupadd -g ${GROUP_GID} ${USERNAME}
RUN useradd -u ${USER_UID} -g ${GROUP_GID} -m ansible_user
RUN echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME}
USER ansible_user
WORKDIR /home/${USERNAME}/ansible
COPY ansible_playbook.yaml .
RUN sudo dnf -y install ansible

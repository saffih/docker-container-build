# add the ssh daemon
# install sshd without startup or password settings.
DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server pwgen \
    && apt-get clean

# to do  change pass for real deployment
echo 'root:changeme' > /root/passwdfile \
  && cat /root/passwdfile | chpasswd

echo 'configure sshd' \
    && mkdir -p /var/run/sshd \
    && sed -ri 's/^UsePrivilegeSeparation /#UsePrivilegeSeparation /g' /etc/ssh/sshd_config \
    && sed -ri 's/^UsePAM /#UsePAM /g' /etc/ssh/sshd_config \
    && sed -ri 's/^PermitRootLogin /#PermitRootLogin /g' /etc/ssh/sshd_config \
    && echo 'PermitRootLogin yes'>> /etc/ssh/sshd_config \
    && echo 'UsePAM no'>> /etc/ssh/sshd_config \
    && echo 'UsePrivilegeSeparation no'>> /etc/ssh/sshd_config \
    && echo 'sshd_config:' \
    && cat /etc/ssh/sshd_config


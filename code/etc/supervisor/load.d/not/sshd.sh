# Remember you need to set a known password by placing the following in the Dockerfile
# RUN echo 'root:changeme' |chpasswd
# unmark service if service needed. 
# best to ADD a new file which is unmarked in the the decendent image.
# service ssh start
echo The service would be start with supervisord. current config:
cat /etc/ssh/sshd_config


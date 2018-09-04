DOCKER_OPTS="--volume=/etc/group:/etc/group "\
"--volume=/etc/shadow:/etc/shadow "\
"--volume=/etc/sudoers.d:/etc/sudoers.d "\
"--volume=/etc/passwd:/etc/passwd "\
"--user=`id -ur` "\
"-e HOME=${HOME} "\
"-v ${HOME}:${HOME} "\
"-v /data:/data "\
"--net=host "\
"--workdir=${HOME} "\
"--shm-size=32g "\
"--memory=32g "\
"--cpus=10 "\
"-d "\
"-t"

docker run ${DOCKER_OPTS} --name ri_prac_instance ri_prac
docker exec -i -u `id -ur` ri_prac_instance sudo -S /etc/init.d/ssh start

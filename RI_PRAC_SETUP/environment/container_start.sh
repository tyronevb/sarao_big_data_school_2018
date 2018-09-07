DOCKER_OPTS="--volume=/etc/group:/etc/group "\
"--volume=/etc/shadow:/etc/shadow "\
"--volume=/etc/sudoers.d:/etc/sudoers.d "\
"--volume=/etc/passwd:/etc/passwd "\
"--user=`id -ur` "\
"-e HOME=${HOME} "\
"-v ${HOME}:${HOME} "\
"-v /data:/data "\
"--workdir=${HOME} "\
"--shm-size=32g "\
"--memory=32g "\
"--cpus=10 "\
"-p 9000:9000 "\
"-p 50100:51000 "\
"-dt"

docker run ${DOCKER_OPTS} --name ri_prac_instance ri_prac
docker exec -it -u 0 ri_prac_instance /etc/init.d/ssh start
docker exec -d -u 0 ri_prac_instance jupyterhub --port 9000

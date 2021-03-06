Packer for Moodle Ansible role testing
--

The Ansible role test (molecule) is quite long because of the sheer amount of dependencies to install (apache,
mysql, php, ...). We can reduce drastically the testing time by pre-building the OS images and then just running
the relevant ansible role.
This series of script will use Harshicorp Packer (https://www.packer.io/) to build the relevant image and then
push it to our CALL Learning docker repository. The images built are based on Jeff Geerling base images (
geerlingguy/docker-xxx) so we can then easily run ansible on them.


Ansible version details
==
The required version of ansible is at least 2.9.6, on which all playbook have been tested

Building the image
==
This is the command to launch the build on docker:
 
    make build 
    
This will generate several docker images for each distribution and database engine 

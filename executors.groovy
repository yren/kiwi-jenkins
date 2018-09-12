/*
set jenkins master executors 5,
default 2
*/
import jenkins.model.*
Jenkins.instance.setNumExecutors(5)
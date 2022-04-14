#!/bin/bash

yum update -y
yum install tomcat
systemctl start tomcat
systemctl enable tomcat
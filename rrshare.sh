#!/bin/bash                                                                                               
#===================================================================#
#   System Required:  CentOS 7                                 #
#   Description: Install rrshare for CentOS7 #
#   Author: Azure <2894049053@qq.com>                               #
#   github: @baiyutribe <https://github.com/baiyuetribe>                     #
#   Blog:  佰阅部落 https://baiyue.one                           #
#===================================================================#
#
#  .______        ___       __  ____    ____  __    __   _______      ______   .__   __.  _______ 
#  |   _  \      /   \     |  | \   \  /   / |  |  |  | |   ____|    /  __  \  |  \ |  | |   ____|
#  |  |_)  |    /  ^  \    |  |  \   \/   /  |  |  |  | |  |__      |  |  |  | |   \|  | |  |__   
#  |   _  <    /  /_\  \   |  |   \_    _/   |  |  |  | |   __|     |  |  |  | |  . `  | |   __|  
#  |  |_)  |  /  _____  \  |  |     |  |     |  `--'  | |  |____  __|  `--'  | |  |\   | |  |____ 
#  |______/  /__/     \__\ |__|     |__|      \______/  |_______|(__)\______/  |__| \__| |_______|
#
#一键脚本
# bash <(curl -L -s https://raw.githubusercontent.com/Baiyuetribe/rrshare_docker/master/rrshare.sh)             
# @安装docker
install_docker() {
	curl -fsSL https://get.docker.com -o get-docker.sh
	bash get-docker.sh
}

# 单独检测docker是否安装，否则执行安装docker。
check_docker() {
	if [ -x "$(command -v docker)" ]; then
		echo "docker is installed"
		# command
	else
		echo "Install docker"
		# command
		install_docker
	fi
}



# check docker


# 以上步骤完成基础环境配置。
echo "恭喜，您已完成基础环境安装，可执行安装程序。"


# 开始安装人人影视客户端
install_rrshare(){
    docker run -d -p 3001:3001 -v /opt/rrdata:/opt/work/store --name rrys baiyuetribe/rrshare   
}
stop_rrshare(){
    docker stop rrys
}
start_rrshare(){
    docker start rrys
}

# 安装h5ai在线播放器
install_h5ai(){
    docker run -t -p 10010:80 -v /opt/rrdata:/h5ai --name h5ai ilemonrain/h5ai:full    
}
stop_h5ai(){
    docker stop h5ai
}
start_h5ai(){
    docker start h5ai
}

# 删除
remove_all(){
    docker rm -f h5ai rrys
    docker rmi -f baiyuetribe/rrshare ilemonrain/h5ai:full
	echo -e "\033[32m已完成卸载\033[0m"
}



#开始菜单
start_menu(){
    clear
	echo "


  ██████╗  █████╗ ██╗██╗   ██╗██╗   ██╗███████╗    ██████╗ ███╗   ██╗███████╗
  ██╔══██╗██╔══██╗██║╚██╗ ██╔╝██║   ██║██╔════╝   ██╔═══██╗████╗  ██║██╔════╝
  ██████╔╝███████║██║ ╚████╔╝ ██║   ██║█████╗     ██║   ██║██╔██╗ ██║█████╗  
  ██╔══██╗██╔══██║██║  ╚██╔╝  ██║   ██║██╔══╝     ██║   ██║██║╚██╗██║██╔══╝  
  ██████╔╝██║  ██║██║   ██║   ╚██████╔╝███████╗██╗╚██████╔╝██║ ╚████║███████╗
  ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝                                                            
    "
    echo -e "\033[43;42m ====================================\033[0m"
    echo -e "\033[43;42m 介绍：人人影视+在线播放               \033[0m"
    echo -e "\033[43;42m 系统：CentOS7  && Docker             \033[0m"
    echo -e "\033[43;42m 作者：Azure                          \033[0m"
    echo -e "\033[43;42m 网站：https://baiyue.one             \033[0m"
    echo -e "\033[43;42m Youtube/B站：佰阅部落                 \033[0m"
    echo -e "\033[43;42m =====================================\033[0m"
    echo
    echo -e "\033[0;33m 1. 安装【人人影视】\033[0m"
    echo -e "\033[0;33m 2. 安装【人人影视+H5ai在线播放】\033[0m"
    echo -e "\033[0;33m 3. 停止【人人+h5ai】\033[0m"
    echo -e "\033[0;33m 4. 启动【人人+h5ai】\033[0m"
    echo -e "\033[37;41m 5. 卸载【人人+H5ai】\033[0m"
    echo " 0. 退出脚本"
    echo
    read -p "请输入数字:" num
    case "$num" in
    1)
	check_docker
	install_rrshare
    echo -e "\033[32m人人影视已安装成功，请访问http://ip:3001\033[0m"
    echo -e "\033[32m默认解锁密码123456\033[0m"
	;;
	2)
	check_docker
	install_rrshare
    install_h5ai
    echo -e "\033[32m人人影视和h5ai已安装成功，人人影视访问地址：http://ip:3001 在线播放地址：http://ip:10010\033[0m"
    echo -e "\033[32m人人影视默认解锁密码123456\033[0m"
	;;
	3)
	stop_h5ai
    stop_rrshare
	echo -e "\033[32m已停用人人影视和h5ai\033[0m"
	;;
	4)
    start_rrshare
	start_h5ai
	echo -e "\033[32m已启动人人影视和h5ai\033[0m"
	;;
	5)
    remove_all
	;;
	0)
	exit 1
	;;
	*)
	clear
	echo "请输入正确数字"
	sleep 5s
	start_menu
	;;
    esac
}

start_menu

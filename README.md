# lltGitRepo
##一、软、硬件环境 
###软件环境：   
开发环境：Windows8、Mysql5.7、Spring Tool Suite 3、Jdk1.8、Apache-Tomcat-8.5  
运行环境：Windows7及以上  

###硬件环境：   
开发环境：处理器型号（AMD Ryzen 5）、内存（16G）、硬盘（400G）  
运行环境：没做要求，只需一台可以使用浏览器的电脑 
##二、安装部署步骤 
###服务端：  
1、通过官网下载并安装JDK1.8版本，然后在系统环境变量中添加JAVA_HOME（JDK目录地址）、Path（%JAVA_HOME%\bin）、classPath（%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar）  
2、在官网地址中下载Tomcat8.5安装包，新增 CATALINA_HOME（Tomcat根目录）系统环境变量。 在PATH中 ,末尾新添加%CATALINA_HOME%\bin;%CATALINA_HOME%\lib。   
3、在tomcat目录\bin目录中 ,运行命令行 ,输入service.bat install 稍候提示 the service "tomcat8" has been installed ,则表示Tomcat安装成功。   
4、把整个项目文件放到D:\apache-tomcat-8.5.50\webapps目录下，此时启动Tomcat服务器，就可以通过http://localhost:8080/AdoptPet/网址访问系统首页。 客户端：由于本系统是基于B/S结构的开发的，所以本系统无需安装，用户只需要有一台联网的电脑，在浏览器中输入本系统的网址，就可以访问本系统。 
##三、运行步骤  
在浏览器中输入本系统的网址，点击回车键，跳转至本系统的首页，未注册用户可以浏览首页、浏览待领养的宠物、浏览其他用户发布的寻物/寻主的贴子、浏览其他用户的留言，如果需要进行送养宠物、领养宠物等操作，则需登录后再进行相关操作。
/bin/cp -rf /root/frontend/Hexo/images/* /root/frontend/Hexo/public/images/
cd /usr/share/nginx/html && rm -rf `ls | grep -vE "demo|404.html|50x.html"`
/bin/cp -rf /root/frontend/Hexo/public/* /usr/share/nginx/html/

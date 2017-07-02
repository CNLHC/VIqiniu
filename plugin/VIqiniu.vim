map <leader>t :py Viqiniu_upbload()<CR>
python <<EOF
import os
import qiniu
from qiniu import *
import re
ak=vim.eval("g:VIqiniu_Ak")
sk=vim.eval("g:VIqiniu_SK")
Bucket=vim.eval("g:VIqiniu_Bucket")
Domain=vim.eval("g:VIqiniu_Domain")
def Viqiniu_upbload():
    def get_Currentline():
        po=vim.current.window.cursor
        se=vim.current.buffer[po[0]-1]
        return se 
    def set_urrentline(line):
        po=vim.current.window.cursor
        vim.current.buffer[po[0]-1]=line
    linebuf=get_Currentline()
    a=qiniu.Auth(ak,sk)
    reobj=re.search("\[!(.*?)\]",linebuf)
    if reobj == None:
        print "No formated path detected"
        return 
    else:
        AbsPath=reobj.group(1)
    AbsPath=os.popen("echo %s"%AbsPath).read().replace('\n','')
	
    os.chdir(os.path.dirname(AbsPath))
    key=os.path.basename(AbsPath)
    token=a.upload_token(Bucket,key)
    ret,info=qiniu.put_file(token,key,AbsPath)
    linebuf=re.sub("\[!(.*?)\]","![%s](%s)"%(key,Domain+key),linebuf)
    set_urrentline(linebuf)
EOF

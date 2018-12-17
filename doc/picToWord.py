# -*- coding: UTF-8 -*-  

import os
from aip import AipOcr
import json  


APP_ID = '15189081'  
API_KEY = 'cotnScfrBneZm9KTKSt3pSYZ'  
SECRET_KEY = '6i2NDvDFLUsNObYq88MLDICnxH02ncvN'  

client = AipOcr(APP_ID, API_KEY, SECRET_KEY)


# # 指定文件夹（拿去用的同学只要改这里）
# os.chdir("C:\\Users\\PC\\Desktop\\picture")
# dirs = os.listdir()


# def get_file_content(filePath):  
#     with open(filePath, 'rb') as fp:  
#         return fp.read()  


# options = {  
#   'detect_direction': 'true',  
#   'language_type': 'CHN_ENG',  
# }  



# print('开始处理，共'+str(len(dirs))+"张图片。")
# cnt=0
# for filePath in dirs:
#     if filePath.split('.')[-1]=='txt':continue
#     cnt+=1
#     print('正在处理第'+str(cnt)+'张图片')
#     result = aipOcr.basicGeneral(get_file_content(filePath), options)  
#     with open(filePath.split('.')[0]+'.txt','w',encoding='utf-8') as ans:
#         for i in result['words_result']:
#                 ans.write(i['words']+'\n')
#     print('处理完成')
# print('全部处理完成！')

""" 读取图片 """
def get_file_content(filePath):
    with open(filePath, 'rb') as fp:
        return fp.read()

image = get_file_content('C:\\sql\\picture\\1.jpg')
print(image)

""" 如果有可选参数 """
options = {}
options["language_type"] = "CHN_ENG"
options["detect_direction"] = "true"
options["detect_language"] = "true"
options["probability"] = "true"

""" 带参数调用通用文字识别, 图片参数为本地图片 """
# result = client.basicGeneral(image, options)

result = client.tableRecognition(
    get_file_content('C:\\sql\\picture\\1.jpg'),
    {
        'result_type': 'json',
    },
)
print(result)

'''
   自定义上传文件名
'''
from django.core.files.storage import FileSystemStorage
# from django.conf import settings
from datetime import datetime
import os

class ImageStorage(FileSystemStorage):

    # def __init__(self, location=settings.MEDIA_ROOT, base_url=settings.MEDIA_URL):
    #     # 初始化,默认的可以不写
    #     super(ImageStorage, self).__init__(location, base_url)


    # 重写 _save方法
    def _save(self, name, content):
        # 文件扩展名
        ext = os.path.splitext(name)[1]
        # 文件目录
        d = os.path.dirname(name)
        # 定义文件名，年月日时分秒毫秒
        fn = datetime.now().strftime('%Y%m%d%H%M%S%f')
        # fn = fn + '_%d' % random.randint(0, 100)
        # 重写合成文件名
        name = os.path.join(d, '%s%s'%(fn,ext))
        # 调用父类方法
        return super(ImageStorage, self)._save(name, content)
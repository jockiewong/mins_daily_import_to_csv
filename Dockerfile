FROM registry.cn-shenzhen.aliyuncs.com/jzdev/tinibase:1.0.0

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir /mins_daily_import_to_csv

WORKDIR /mins_daily_import_to_csv

ADD . /mins_daily_import_to_csv

WORKDIR /mins_daily_import_to_csv

RUN pip install -r requirements.txt -i https://pypi.douban.com/simple

ENTRYPOINT ["python", "run.py"]
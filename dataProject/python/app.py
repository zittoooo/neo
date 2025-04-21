from fastapi import FastAPI
from database import db_conn
from models import Senior
from sqlalchemy import *

app = FastAPI(debug=True)

db = db_conn()
session = db.sessionmaker()


@app.get("/r_seniorAccident")
def getSeniorAccident(year=2023, region='서울'):
    if (year is None) or (region is None):
        return "연도와 지역을 입력하세요."
    else :
        result = session.query(Senior).filter(Senior.YEAR == year, Senior.REGION == region).all()
        
        if result:
            print(result)
            return result
        else:
            return "연도와 지역을 찾을 수 없습니다."
        
        

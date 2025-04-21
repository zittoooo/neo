from sqlalchemy import Column, TEXT, INT
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Senior(Base):
    __tablename__ = 'Senior'
    
    id = Column(INT, primary_key=True, autoincrement=True)
    YEAR = Column(INT, nullable=False)
    REGION = Column(TEXT, nullable=False)
    ACCIDENT_COUNT = Column(INT, nullable=False)
    DEATH_COUNT = Column(INT, nullable=False)
    INJURY_COUNT = Column(INT, nullable=False)
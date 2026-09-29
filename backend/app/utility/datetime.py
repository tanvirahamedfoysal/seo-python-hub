from datetime import datetime
from zoneinfo import ZoneInfo

def utc_now():
    return datetime.now(ZoneInfo("UTC"))

def bd_now():
    return datetime.now(ZoneInfo("Asia/Dhaka"))
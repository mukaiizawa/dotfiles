datetime

# import

    import datetime
    from datetime import datetime, date, time, timedelta

## datetime
### コンストラクタ

    datetime(year, month, day, hour=0, minute=0, second=0, microsecond=0, tzinfo=None)
    datetime(2020, 2, 4, 0, 0, 0, 0, timezone.utc)

### システム時刻を取得

    datetime.now()

### unix timeの取得

    datetime.now().timestamp()

### unix timeから生成

    datetime.fromtimestamp(1675250652)

### 翌日

    datetime.now() + timedelta(1)

### 年月日の取得

    >>> dt = datetime.now()
    >>> dt.year
    2023
    >>> dt.month
    10
    >>> dt.day
    6

## date
### システム日付を取得

    date.today()

## timedelta
二つの時刻の差を表す。コンストラクタで生成するほかに、datetime objectの加減によって生成される。

### コンストラクタ

    timedelta(days=0, seconds=0, microseconds=0, milliseconds=0, minutes=0, hours=0, weeks=0)

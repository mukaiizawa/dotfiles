datetime

# import

    import datetime
    from datetime import datetime, date, time, timedelta

## date
### コンストラクタ

    date(year, month, day)

### インスタンス属性

    year
        両端値を含む MINYEAR から MAXYEAR までの値
    month
        両端値を含む 1 から 12 までの値
    day
        1 から与えられた月と年における日数までの値

### システム日付の取得

    date.today()

## time
### コンストラクタ

    time(hour=0, minute=0, second=0, microsecond=0, tzinfo=None, *, fold=0)

### インスタンス属性

    time.hour
        in range(24) を満たす。
    time.minute
        in range(60) を満たす。
    time.second
        in range(60) を満たす。
    time.microsecond¶
        in range(1000000) を満たす。

## datetime
dateおよびtimeの情報が入っているオブジェクト。

### コンストラクタ

    datetime(year, month, day, hour=0, minute=0, second=0, microsecond=0, tzinfo=None)
    datetime(2020, 2, 4, 0, 0, 0, 0, timezone.utc)

### インスタンス属性

year
month

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

## timedelta
二つの時刻の差を表す。コンストラクタで生成するほかに、datetime objectの加減によって生成される。

### コンストラクタ

    timedelta(days=0, seconds=0, microseconds=0, milliseconds=0, minutes=0, hours=0, weeks=0)

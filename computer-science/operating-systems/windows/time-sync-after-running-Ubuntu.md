# Time sync after running Ubuntu﻿

So I experienced problems with time after switching from Ubuntu to Windows. The time has changed.

To set the Internet time I created the next .bat script:

```powershell
svchost.exe -k LocalService
w32tm /resync
```

TODO: find out how to run this script after launching Windows.

 


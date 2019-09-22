# Time sync after running Ubuntu﻿

So I experienced problems with time after switching from Ubuntu to Windows. The time has changed.

To set the Internet time I created the next .bat script:

```powershell
net start w32time
w32tm /resync
```

TODO: find out how to run this script after launching Windows.

 


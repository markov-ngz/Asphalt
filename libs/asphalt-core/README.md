
# Install from private Repo 
0. Create a classic token with read package scope 
1. Edit settings.xml
```sh
nano ~/.m2/settings.xml
``` 
2. Add the block to the file 
```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0">
    ...
    <servers>
        <server>
            <id>asphalt</id>
            <username>YOUR_USERNAME</username>
            <password>YOUR_PAT</password>
        </server>
    </servers>

</settings>
``` 
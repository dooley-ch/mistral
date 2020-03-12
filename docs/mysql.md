# MySQL Database

### Introduction

MySQL is written in C and C++. Its SQL parser is written in YACC, but it uses a home-brewed lexical analyzer.  MySQL works on many system platforms including FreeBSD, Linux, Symbian etc.

The MySQL server software itself and the client libraries use dual-licensing distribution. They are offered under GPL version 2 or a proprietary license.

MySQL has received positive reviews, and reviewers noticed it "performs extremely well in the average case" and that the "developer interfaces are there, and the documentation (not to mention feedback in the real world via Web sites and the like) is very, very good". It has also been tested to be a "fast, stable and true multi-user, multi-threaded sql database server".

### Preferred Design

The business entities of the database are set out below. Some of the key features included:

- The id field is in upper case to indicate that it is auto generated, otherwise it would appear in lower case.
- The tables playlist, artist, album, genre and media_type include a field titled name_lower which repeats the contents of the name field in lower case and is used to ensure that the name is unique.
- The album field contains a title_lower field, again to ensure that the titles remain unique.

![](/Users/jdooley/Development/mistral/docs/img/mysql-preferred-main.png)

There is an audit table for each of the business entities define in the database model.

![](/Users/jdooley/Development/mistral/docs/img/mysql-preferred-audit.png)

The system tables includes a full complement of tables as described above. In particular an application table has been introduced to provide for the classification of setup, activity log, logging and user setup and configuration information.

Because each application has a requirement to know what it's id is, the application table includes a unique key that allows the application to retrieve it.

The user field is just a simple string field and is not associated in any way with the rest of the model. This is deliberate and ensures that the integrity of the business model is not in any way impacted by changes in the Human Resources domain. Although it assumes that the human resources environment ensures the the reference will be unique and not repeated over time by being assigned to new employees.

![](/Users/jdooley/Development/mistral/docs/img/mysql-preferred-system.png)

### Data Type Stretcher

MySQL offers many data types, but we concentrate on the following types:

| Name             | Comment                                                                                                                                                                                                                                                                                                                                                                                                           |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CHAR(size)       | A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1                                                                                                                                                                                                                                   |
| VARCHAR(size)    | A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum column length in characters - can be from 0 to 65535                                                                                                                                                                                                                                    |
| TEXT(size)       | Holds a string with a maximum length of 65,535 bytes                                                                                                                                                                                                                                                                                                                                                              |
| BLOB(size)       | For BLOBs (Binary Large OBjects). Holds up to 65,535 bytes of data                                                                                                                                                                                                                                                                                                                                                |
| TINYINT          | A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)                                                                                                                                                                                                                                                    |
| BOOL             | Zero is considered as false, nonzero values are considered as true.                                                                                                                                                                                                                                                                                                                                               |
| INT(size)        | A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)                                                                                                                                                                                                                                   |
| DECIMAL(size, d) | An exact fixed-point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. The maximum number for size is 65. The maximum number for d is 30. The default value for size is 10. The default value for d is 0.                                                                                                                    |
| DATE             | A date. Format: YYYY-MM-DD. The supported range is from '1000-01-01' to '9999-12-31'                                                                                                                                                                                                                                                                                                                              |
| DATETIME         | A date and time combination. Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'. Adding DEFAULT and ON UPDATE in the column definition to get automatic initialization and updating to the current date and time                                                                                                                                             |
| TIMESTAMP        | A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD hh:mm:ss. The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC. Automatic initialization and updating to the current date and time can be specified using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP in the column definition |

![](/Users/jdooley/Development/mistral/docs/img/mysql-stretched-main.png)

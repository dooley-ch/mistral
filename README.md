# Mistral

![Wind](splash.jpg)

This sample database is broadly based on the [Chinook sample database](https://github.com/lerocha/chinook-database) The
main difference would be:

- The schema is more typical of a real production database, in that it includes views and store procedures
- It is scripted rather than being created by a ORM type tool
- It includes audit tables to track changes 
- It supports optimistic concurrency
- It takes advantage of DBMS specific features where they exist

In the traditions of Microsoft's demo database naming convention, We offer a European version to stand with Northwind 
and Chinook - Mistral, named after the French wind of the same name.

## The Business Domain

The Mistral data model represents a digital media store, similar to that of the Chinook data model, but extended to 
include auditing, views etc. The model includes tables for artists, albums, media tracks, invoices and customers.

## Database Design

This section gives an overview of the typical modern database design. One of the primary technical design objectives 
was to make it easy to map to the typical object models offered by languages such as C#, Java or Python for example.

Typically, the design ignores the natural primary key on tables and goes for an auto generated primary key as this 
makes it easier to load and map records to classes in the chosen programming language.

### System Tables

All modern databases can benefit from having a couple of standard tables, to address issues such as the database 
version number, if all updates have been applied to the database and so on. 

#### Version Table

The version table is optional, but can is definitely worth including in your design as it servers two purposes:

- It allows one to check what the current version of the database is and thus one can ensure that the application wishing to use the database is in fact compatible with that particular version.
- It provides a history of the upgrade scripts that have been applied to the database over time.

The version table should include at least the following columns:

```mermaid
erDiagram
    version ||--o{ version_step: ""

    version {
        integer ID PK "A unique id that identifies the record in the table"
        integer major "The major version number"
        integer minor "The minor version number"
        integer build "The particular build number"
        boolean succeeded "Flag to indicate if the installation was successful"        
        string comment
        timestamp started_at "The date and time the installation/updated started"
        timestamp ended_at "The date and time the installation/updated finished"
    }
    
    version_step {
        integer ID PK "A unique id that identifies the record in the table"
        string step "The name of the step that created the entry"
        string comment "Comments on the execution the step"
        boolean succeeded "Flag to indicate if the step was successful"
        integer version_id FK "The id of the version being installed"
        integer lock_version "The optimistic concurrency flag" 
        timestamp created_at "The date and time the record was created"
        timestamp updated_at "The date and time the record was last updated"
    }
```

##### Activity Log

This table is also optional, but might be worth including in your database as a simple means of tracking significant 
events in database, such as the creating of a new user account, a customer account and so on. Such tables should 
include the following fields:

```mermaid
erDiagram
    activity_type ||--o{ activity_log: ""
    activity_source ||--o{ activity_log: ""
    
    activity_log {
        integer ID PK "A unique id that identifies the record in the table"
        timestamp logged_at "The date and time the entry was made"
        string message "Details of the activity being logged"
        integer activity_type_id FK "The id of the activity type being recorded"
        integer activity_source_id FK "The id of the source creating the entry"
    }
    
    activity_type {
        integer ID PK "A unique id that identifies the record in the table"
        string name "The name of the activity being recorded, such as 'Custoemr account creation'"
        integer lock_version "The optimistic concurrency flag" 
        timestamp created_at "The date and time the record was created"
        timestamp updated_at "The date and time the record was last updated"
    }

    activity_source {
        integer ID PK "A unique id that identifies the record in the table"
        string name "The name of the source creating the entry such as an application"
        integer lock_version "The optimistic concurrency flag" 
        timestamp created_at "The date and time the record was created"
        timestamp updated_at "The date and time the record was last updated"
    }
    
```

### Common Fields

All business entities in the database model should have the following fields to aid the development of OOP based 
applications and also to hand situations where records may be updated from multiple sources.

```mermaid
erDiagram
    business_table {
        integer ID PK "A unique id that identifies the record in the table"
        integer lock_version "The optimistic concurrency flag" 
        timestamp created_at "The date and time the record was created"
        timestamp updated_at "The date and time the record was last updated"
    }
    
    xxx_business_table {
        integer ID PK "A unique id that identifies the record in the table"
        timestamp logged_at "The date and time the entry was made"
        character action "The type of action performed on the record"
        integer record_id "The id of the record in the business table being audited"
        integer lock_version "The value of the lock_version record in the business table" 
    }
```

If you have worked in IT for any period of time, no doubt you will have encountered situations where it is unclear if 
a record was updated or not and who actually performed the operation. The purpose of xxx_table is to address this issue 
by tracking three types of change to individual records: INSERT, UPDATE and DELETE. The best approach from a performance 
point of view is to use an audit table per business table.

The process of manipulating a business record involves creating a transaction, performing the action of the desired 
record, creating a corresponding audit record and then committing the transaction if all is OK, otherwise the 
transaction is rolled back.

```mermaid
flowchart TD
    A[Start]
    A --> B[Create Transaction]
    B --> C[Insert Business Record]
    B --> D[Insert Audit Record]
    C --> E{All OK?}
    D --> E{All OK?}
    E -- No --> F[Rollback Transaction]
    E -- Yes --> G[Commit Transaction]
    F --> H[End]
    G --> H[End]    
```

## Design Documents

The individual implementations are discussed in these documents:

| Database Management System       | Description                                  |
|----------------------------------|----------------------------------------------|
| [SQLite](docs/sqlite.md)         | The design & implementation using SQLite     |
| [MySQL](docs/mysql.md)           | The design & implementation using MySQL      |
| [PostgreSQL](docs/postgresql.md) | The design & implementation using PostgreSQL |

# MySQL Design & Implementation

![Splash](mysql_splash.jpg)

## System Tables

```mermaid
erDiagram    
    version ||--o{ version_item: ""
    
    version {
        tinyint id PK
        tinyint major
        tinyint minor
        tinyint build
        boolean is_valid
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    version_item {
        smallint ID PK
        varchar step
        varchar comment
        tinyint version_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    activity_source ||--o{ activity_log : ""
    activity_type ||--o{ activity_log : ""
    
    activity_log {
        int ID PK
        timestamp logged_at  
        mediumtext message
        tinyint activity_source_id FK
        tinyint activity_type_id FK      
    }
    
    activity_source {
        tinyint ID PK  
        varchar name  
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    activity_type {
        tinyint ID PK  
        varchar name  
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
```

## Business Tables

```mermaid
erDiagram
    artist ||--o{ album : ""
    album ||--o{ track : ""
    
    playlist ||--o{ playlist_track : ""
    track ||--o{ playlist_track : ""
    
    track ||--o{ invoice_item : ""
    invoice ||--o{ invoice_item : ""
        
    genre ||--o{ track : ""   
    media_type ||--o{ track : ""
     
    customer ||--o{ invoice : ""
     
    employee ||--o{ customer : "Supports"
    employee ||--o{ employee : "Manages"
     
    artist {
        int id PK
        varchar name
        varchar name_lower
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    album {
        int id PK
        varchar title
        varchar title_lower
        int artist_id FK        
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    playlist {
        int id PK
        varchar name
        varchar name_lower
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    playlist_track {
        int id PK
        int playlist_id FK
        int track_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    invoice_item {
        int id PK
        int quantity
        int unit_price
        int track_id FK
        int invoice_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }

    track {
        int id PK
        varchar name
        varchar name_lower
        varchar composer
        int milliseconds
        int bytes
        decmial unit_price
        int album_id FK
        tinyint media_type_id FK
        tinyint genre_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }

    genre {
        tinyint id PK
        varchar name
        varchar name_lower
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }

    media_type {
        tinyint id PK
        varchar name
        varchar name_lower
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    invoice {
        int id PK
        date invoice_date
        varchar address
        varchar city
        varchar state
        varchar country
        varchar post_code
        integer total
        int customer_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }

    customer {
        int id PK
        varchar title
        varchar first_name
        varchar last_name
        varchar address
        varchar city
        varchar state
        varchar country
        varchar post_code
        varchar phone
        varchar fax
        varchar email
        int employee_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }
    
    employee {
        int id PK
        varchar title
        varchar first_name
        varchar last_name
        date date_of_birth
        date hire_date
        varchar address
        varchar city
        varchar state
        varchar country
        varchar post_code
        varchar phone
        varchar fax
        varchar email
        int manager_id FK
        tinyint lock_version
        timestamp created_at
        timestamp updated_at
    }    
```

## Views

The database contains two views, represented here as tables:

```mermaid
erDiagram
    albums {
        integer id "The album id"
        text artist "The artist's nme"
        text title "The album title"
    }
    
    playlists {
        integer id "The playlist id"
        text name "The playlist name"
        text track "The track name"
    }
```

## Deployment

There are two options:

- Restore the database from the backup (backup.sql) stored in the mysql folder.
- Create a new database using the install.sql script and the data scripts 01 thru 05 to populate the tables.

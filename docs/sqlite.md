# SQLite Design & Implementation

![Splash](sqlite_splash.jpg)

The SQLite is not a full blown DBMS and so the implementation is limited to the capabilities of the DBMS.

## System Tables

```mermaid
erDiagram
    activity_source ||--o{ activity_log : ""
    activity_type ||--o{ activity_log : ""
    
    version {
        integer ID PK
        integer major
        integer minor
        integer build
        integer lock_version
        text created_at
        text updated_at
    }
    
    activity_log {
        integer ID PK
        text name
        text logged_at  
        text message
        integer activity_source_id FK
        integer activity_type_id FK      
    }
    
    activity_source {
        integer ID PK
        text name
        integer lock_version
        text created_at
        text updated_at
    }
    
    activity_type {
        integer ID PK    
        integer lock_version
        text created_at
        text updated_at
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
     
    employee ||--o{ customer : ""
    employee ||--o{ employee : Manager
     
    artist {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        text created_at
        text updated_at
    }
    
    album {
        integer ID PK
        text title
        text title_lower
        integer artist_id FK        
        integer lock_version
        text created_at
        text updated_at
    }
    
    playlist {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        text created_at
        text updated_at
    }
    
    playlist_track {
        integer ID PK
        integer playlist_id FK
        integer track_id FK
        integer lock_version
        text created_at
        text updated_at
    }
    
    invoice_item {
        integer ID PK
        integer quantity
        integer unit_price
        integer track_id FK
        integer invoice_id FK
        integer lock_version
        text created_at
        text updated_at
    }

    track {
        integer ID PK
        text name
        text name_lower
        text composer
        integer milliseconds
        integer bytes
        integer unit_price
        integer album_id FK
        integer media_type_id FK
        integer genre_id FK
        integer lock_version
        text created_at
        text updated_at
    }

    genre {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        text created_at
        text updated_at
    }

    media_type {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        text created_at
        text updated_at
    }
    
    invoice {
        integer ID PK
        text invoice_date
        text address
        text city
        text state
        text country
        text post_code
        integer total
        integer customer_id FK
        integer lock_version
        text created_at
        text updated_at
    }

    customer {
        integer ID PK
        text title
        text first_name
        text last_name
        text address
        text city
        text state
        text country
        text post_code
        text phone
        text fax
        text email
        integer lock_version
        text created_at
        text updated_at
    }
    
    employee {
        integer ID PK
        text title
        text first_name
        text last_name
        text date_of_birth
        text hire_date
        text address
        text city
        text state
        text country
        text post_code
        text phone
        text fax
        text email
        integer manager_id FK
        integer lock_version
        text created_at
        text updated_at
    }    
```

## Audit Tables

The audit tables are not modeled as they simply consist of the common fields described in the read me and the business 
attributes described above.

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

The implementation is delivered as a SQLite database file.  To use just copy the file to your working folder.

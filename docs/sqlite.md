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
        created_at text
        updated_at text
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
        created_at text
        updated_at text
    }
    
    activity_type {
        integer ID PK    
        integer lock_version
        created_at text
        updated_at text
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
        created_at text
        updated_at text
    }
    
    album {
        integer ID PK
        text title
        text title_lower
        integer artist_id FK        
        integer lock_version
        created_at text
        updated_at text
    }
    
    playlist {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        created_at text
        updated_at text
    }
    
    playlist_track {
        integer ID PK
        integer playlist_id FK
        integer track_id FK
        integer lock_version
        created_at text
        updated_at text
    }
    
    invoice_item {
        integer ID PK
        integer quantity
        integer unit_price
        integer track_id FK
        integer invoice_id FK
        integer lock_version
        created_at text
        updated_at text
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
        created_at text
        updated_at text
    }

    genre {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        created_at text
        updated_at text
    }

    media_type {
        integer ID PK
        text name
        text name_lower
        integer lock_version
        created_at text
        updated_at text
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
        created_at text
        updated_at text
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
        created_at text
        updated_at text
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
        created_at text
        updated_at text
    }    
```

## Audit Tables

The audit tables are not modeled as they simply consist of the common fields described in the read me and the business 
attributes described above.

## Deployment

TODO

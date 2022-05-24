# PostgreSQL Design & Implementation

![Splash](postgresql_splash.jpg)

## System Tables

```mermaid
erDiagram    
    version ||--o{ version_item: ""
    
    version {
        smallint id PK
        smallint major
        smallint minor
        smallint build
        boolean is_valid
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    version_item {
        serial ID PK
        varchar step
        varchar comment
        smallint version_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    activity_source ||--o{ activity_log : ""
    activity_type ||--o{ activity_log : ""
    
    activity_log {
        serial ID PK
        timestamptz logged_at  
        test message
        smallint activity_source_id FK
        smallint activity_type_id FK      
    }
    
    activity_source {
        smallint ID PK  
        varchar name  
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    activity_type {
        smallint ID PK  
        varchar name  
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
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
     
    employee ||--o{ customer : "Supporter"
    employee ||--o{ employee : Manager
     
    artist {
        serial id PK
        varchar name
        varchar name_lower
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    album {
        serial id PK
        varchar title
        varchar title_lower
        integer artist_id FK        
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    playlist {
        serial id PK
        varchar name
        varchar name_lower
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    playlist_track {
        serial id PK
        integer playlist_id FK
        integer track_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    invoice_item {
        serial id PK
        integer quantity
        integer unit_price
        integer track_id FK
        integer invoice_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }

    track {
        serial id PK
        varchar name
        varchar name_lower
        varchar composer
        smallint milliseconds
        smallint bytes
        smallint unit_price
        integer album_id FK
        integer media_type_id FK
        integer genre_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }

    genre {
        serial id PK
        varchar name
        varchar name_lower
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }

    media_type {
        serial id PK
        varchar name
        varchar name_lower
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    invoice {
        serial id PK
        varchar invoice_date
        varchar address
        varchar city
        varchar state
        varchar country
        varchar post_code
        integer total
        integer customer_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }

    customer {
        serial id PK
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
        integer supporter_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }
    
    employee {
        serial id PK
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
        integer manager_id FK
        smallint lock_version
        timestamptz created_at
        timestamptz updated_at
    }    
```

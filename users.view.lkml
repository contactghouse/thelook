view: users {
  sql_table_name: public.users ;;

  dimension: 1pk_user_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    description: "Date user created an account"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: first_name {
    description: "User's First Name"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    description: "User's Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    description: "User's Full Name"
    type: string
    sql: ${first_name} || ' ' || ${last_name} ;;
  }

  dimension: city {
    description: "User's City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    description: "User's State"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    description: "User's zipcode"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: country {
    description: "User's Country"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: age {
    description: "User's Age"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    description: "Age tier"
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: integer
    sql: ${age} ;;
  }

  dimension: gender {
    description: "User's gender"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: email {
    description: "User's email"
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: traffic_source {
    description: "Source from where we obtained this user"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: latitude {
    description: "User's latitude"
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    description: "User's longitude"
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    description: "User's location in latitude and longitude"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: distance_from_distribution_center {
    description: "User's distance to distribution centers"
    type: distance
    start_location_field: distribution_centers.location
    end_location_field: users.location
    units: miles
  }

  measure: count {
    description: "Count"
    type: count
    filters:{
      field: 1pk_user_id
      value: "not null"
    }
    drill_fields: [1pk_user_id, first_name, last_name]
  }

  measure: men_count {
    description: "Count of users with gender=male"
    type: count
    filters: {
      field: gender
      value: "Male"
    }
  }

  measure: female_count {
    description: "Count of users with gender=female"
    type: count
    filters: {
      field: gender
      value: "Female"
    }
  }
}

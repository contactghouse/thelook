view: distribution_centers {
  sql_table_name: public.distribution_centers ;;

  dimension: 1pk_distribution_center_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: longitude {
    description: "Longitude coordinates of distribution center"
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: latitude {
    description: "Latitute coordinates of distribution center"
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    description: "Coordinates of distribution center"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: name {
    description: "Name of distribution center"
    type: string
    sql: ${TABLE}.name ;;
  }
}
